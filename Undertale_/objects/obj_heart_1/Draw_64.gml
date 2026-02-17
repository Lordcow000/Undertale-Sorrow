//draw_rectangle_colour(32, 250, 606, 389, c_black, c_black, c_black, c_black, false)
//draw_rectangle_colour(32, 250, 606, 389, c_white, c_white, c_white, c_white, true)
draw_rectangle_colour(275, 400, 275 + global.Game_Data.MaxHealth, 420, c_yellow, c_yellow, c_yellow, c_yellow, false)
draw_rectangle_colour((275 + global.Game_Data.MaxHealth) - (global.Game_Data.MaxHealth - global.Game_Data.Health), 400, 275 + global.Game_Data.MaxHealth, 420, c_red, c_red, c_red, c_red, false)
//we need the small font


layer_background_blend(bg_id,global.battle.bg_colour);

switch(Selec_Index)
	{//153
		case 0:
		draw_sprite(spr_fight, 1, 32, 432)
		draw_sprite(spr_act, 0, 185, 432)
		draw_sprite(spr_item, 0, 345, 432)
		draw_sprite(spr_mercy, 0, 500, 432)
		break
		case 1:
		draw_sprite(spr_fight, 0, 32, 432)
		draw_sprite(spr_act, 1, 185, 432)
		draw_sprite(spr_item, 0, 345, 432)
		draw_sprite(spr_mercy, 0, 500, 432)
		break
		case 2:
		draw_sprite(spr_fight, 0, 32, 432)
		draw_sprite(spr_act, 0, 185, 432)
		draw_sprite(spr_item, 1, 345, 432)
		draw_sprite(spr_mercy, 0, 500, 432)
		break
		case 3:
		draw_sprite(spr_fight, 0, 32, 432)
		draw_sprite(spr_act, 0, 185, 432)
		draw_sprite(spr_item, 0, 345, 432)
		draw_sprite(spr_mercy, 1, 500, 432)
		break
	}

if State = State_Enemy_Select
{
	array_foreach(enemies,function(enemy, _index)// Loops through each enemy
	{
		if(enemy.spareable)
			draw_set_colour(c_yellow);
		
		if(enemy.spared || enemy.killed)
		{
			//dont draw
		}
		
		else if (enemy_select_index == _index)
		{
			draw_sprite(spr_heart,0,52,275+(_index*30))
			
			draw_text_transformed(90, 265+(_index*30), "* "+enemy.name, 2, 2, 0);
		}
		
		else
		{
			draw_text_transformed(90, 265+(_index*30), "* "+enemy.name, 2, 2, 0);
		}
		draw_set_colour(c_white);           
	})
		
	
}

if(State = State_Quicktime)
{
//draw_sprite(spr_battle_quicktime, 0, 32, 250);
//draw_sprite(spr_UT_qte, 0, (global.idealborder[1]+global.idealborder[0])/2, (global.idealborder[2]+global.idealborder[3])/2);
draw_sprite(spr_UT_qte,0,319,319.5);
draw_sprite(spr_battle_bar, floor(battle_bar_index), 16 + Quicktime_Pos, 322.5);
draw_sprite(spr_debug_pixel,0,319,319.5);
}

if State = State_Act_Select
{
	var cell_w = 240;
	var cell_h = 32;
	var enemy = enemies[enemy_select_index];

	for (var i = 0; i < array_length(enemy.actions); i++)
	{
	    var col = i mod act_cols;
	    var row = i div act_cols;

	    var draw_x = global.idealborder[0]+68 + col * cell_w;
	    var draw_y = global.idealborder[2]+20 + row * cell_h;
		
		if(act_index = i)
		{
			draw_sprite(spr_heart,0,draw_x - 38, draw_y+10);
		}
		draw_text_transformed(draw_x, draw_y, "* "+enemy.actions[i].name, 2,2,0);
		
	}
	
	
}

if State = State_Items
{

	var cell_w = 256;
	var cell_h = 32;

	for (var i = 0; i < array_length(current_page_list); i++)
	{
	    var col = i mod item_cols;
	    var row = i div item_cols;

	    var draw_x = global.idealborder[0]+68 + col * cell_w;
	    var draw_y = global.idealborder[2]+20 + row * cell_h;
		
		if(item_index = i)
			draw_sprite(spr_heart, 0, draw_x-36,draw_y+8);
	
		if(current_page_list[i] != "Nothing")
		{
			draw_text_transformed(draw_x, draw_y, "* "+ Fetch_item(current_page_list[i]).battle_name,2,2,0);
		}
	}
	if(pages_on)
	{
		if(current_page == "left")
			draw_text_transformed(global.idealborder[0]+323,global.idealborder[2]+84,"  PAGE 1",2,2,0);
		else if(current_page == "right")
			draw_text_transformed(global.idealborder[0]+323,global.idealborder[2]+84,"  PAGE 2",2,2,0);
	}
	
	//for (var n = 0; n <= 7; n++)
    //{
	//	var item = global.Game_Data.Inventory[n]
	//	if ((n+1) % 2 == 0)
	//	{
	//		var multi = 240;
	//		var row = floor(n / 2);
			
	//	}
		
	//	else
	//	{
	//		var multi = 0;
	//		var row = floor(n / 2);
	//	}
		
	//	if (item_index == n)
	//	{
			
	//		if (global.Game_Data.Inventory[n] != "Nothing")
	//		{
	//			draw_sprite(spr_heart, 0, global.idealborder[0]+32+(multi),global.idealborder[2]+28 + (row*32));
	//			draw_text_transformed(global.idealborder[0]+68 +(multi), global.idealborder[2]+20 + (row*32), "* "+Fetch_item(item).battle_name, 2, 2, 0);
	//		}
	//	}
	//	else
	//	{
	//		if (global.Game_Data.Inventory[n] != "Nothing")
	//		{
	//			draw_text_transformed(global.idealborder[0]+68+(multi), global.idealborder[2]+20 + (row*32), "* "+Fetch_item(item).battle_name, 2, 2, 0);
	//		}
	//	}
	//}


		
	
}

if(State = State_Mercy)
{
for(var i = 0; i < array_length(mercy_select); i ++)
{
	draw_text_transformed(90, 265+(i*30), "* "+mercy_select[i], 2, 2, 0);
}

draw_sprite(spr_heart,0,52,275+(mercy_index * 30))


}

if(State = State_Flee)
{
draw_text_transformed(90, 265, "* " + "I'm outta here", 2, 2, 0);
//draw_sprite(spr_heart_walk,1,52 + Heart_Pos_Mod,275+(Mercy_Index * 30))
}