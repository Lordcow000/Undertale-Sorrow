//draw_rectangle_colour(32, 250, 606, 389, c_black, c_black, c_black, c_black, false)
//draw_rectangle_colour(32, 250, 606, 389, c_white, c_white, c_white, c_white, true)
draw_rectangle_colour(275, 400, 275 + global.Game_Data.MaxHealth, 420, c_yellow, c_yellow, c_yellow, c_yellow, false)
draw_rectangle_colour((275 + global.Game_Data.MaxHealth) - (global.Game_Data.MaxHealth - global.Game_Data.Health), 400, 275 + global.Game_Data.MaxHealth, 420, c_red, c_red, c_red, c_red, false)
//we need the small font

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
if State = State_Selec
{

	
draw_set_font(fnt_main);
if(string_length(Dialog) > Current_Char)
{
Current_Char ++;
}

draw_set_colour(c_white);
draw_text_ext_transformed(52, 265, "* " + string_copy(Dialog, 1, Current_Char), 20, 348, 2, 2, 0);

	//draw_text_transformed(52, 281, string_hash_to_newline("* You feel like you're not gonna get #copyrighted."), 2, 2, 0)
}

if State = State_Act_Consequence
{
draw_set_font(fnt_main);
if(string_length(Dialog) > Current_Char)
{
Current_Char ++;
}

if(keyboard_check_pressed(ord("Z")))
{
if(Current_Char < string_length(Dialog))
{
if(Current_Char > 2)
{
Current_Char = string_length(Dialog);
}
}
}

draw_set_colour(c_white);
draw_text_ext_transformed(52, 265, "* " + string_copy(Dialog, 1, Current_Char), 20, 348, 2, 2, 0);

	//draw_text_transformed(52, 281, string_hash_to_newline("* You feel like you're not gonna get #copyrighted."), 2, 2, 0)
}

if State = State_Fight or State = State_Act_Enemy_Select
{

	
	array_foreach(Enemy_Count,function(enemy, _index) // Loops through each enemy
	{
		if (Enemy_select_Index == _index)
		{
			draw_sprite(spr_heart,0,52,275+(_index*30))
			draw_text_transformed(90, 265+(_index*30), "* "+enemy.name, 2, 2, 0);
		}
		else
		{
			draw_text_transformed(90, 265+(_index*30), "* "+enemy.name, 2, 2, 0);
		}
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
	

	var enemy = Enemy_Count[Enemy_select_Index];
	array_foreach(enemy.act_actions,function(act, _index) // Loops through each enemy
	{
		if ((_index+1) % 2 == 0)
		{
			var multi = 200;
			var row = floor(_index / 2);
			
		}
		
		else
		{
			var multi = 0;
			var row = floor(_index / 2);
		}
		if (Act_Index == _index)
		{
			
			draw_sprite(spr_heart,0,52+(multi),275+(row*30));
			draw_text_transformed(90+(multi), 265+(row*30), "* "+act.Name, 2, 2, 0);
		}
		else
		{
			draw_text_transformed(90+(multi), 265+(row*30), "* "+act.Name, 2, 2, 0);
		}
	})

		
	
}

if(State = State_Mercy)
{
for(var i = 0; i < array_length(Mercy_Select); i ++)
{
	draw_text_transformed(90, 265+(i*30), "* "+Mercy_Select[i], 2, 2, 0);
}

draw_sprite(spr_heart,0,52,275+(Mercy_Index * 30))
}

if(State = State_Flee)
{
draw_text_transformed(90, 265, "* " + "I'm outta here", 2, 2, 0);
draw_sprite(spr_heart_walk,1,52 + Heart_Pos_Mod,275+(Mercy_Index * 30))
}