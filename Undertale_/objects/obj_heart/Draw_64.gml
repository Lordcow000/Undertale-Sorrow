draw_rectangle_colour(32, 250, 606, 389, c_white, c_white, c_white, c_white, true)
if State != State_Quicktime
{
switch(Selec_Index)
	{
		case 0:
		draw_sprite(spr_fight, 1, 32, 432)
		draw_sprite(spr_act, 0, 185, 432)
		draw_sprite(spr_item, 0, 338, 432)
		draw_sprite(spr_mercy, 0, 491, 432)
		break
		case 1:
		draw_sprite(spr_fight, 0, 32, 432)
		draw_sprite(spr_act, 1, 185, 432)
		draw_sprite(spr_item, 0, 338, 432)
		draw_sprite(spr_mercy, 0, 491, 432)
		break
		case 2:
		draw_sprite(spr_fight, 0, 32, 432)
		draw_sprite(spr_act, 0, 185, 432)
		draw_sprite(spr_item, 1, 338, 432)
		draw_sprite(spr_mercy, 0, 491, 432)
		break
		case 3:
		draw_sprite(spr_fight, 0, 32, 432)
		draw_sprite(spr_act, 0, 185, 432)
		draw_sprite(spr_item, 0, 338, 432)
		draw_sprite(spr_mercy, 1, 491, 432)
		break
	}
}
	else
	{
		draw_sprite(spr_fight, 0, 32, 432)
		draw_sprite(spr_act, 0, 185, 432)
		draw_sprite(spr_item, 0, 338, 432)
		draw_sprite(spr_mercy, 0, 491, 432)
	}
if State = State_Selec
{
draw_set_font(Font1);
if(string_length(Dialog) > Current_Char)
{
Current_Char ++;
}

draw_set_colour(c_white);
draw_text_ext_transformed(52, 265, "* " + string_copy(Dialog, 1, Current_Char), 20, 348, 2, 2, 0);

	//draw_text_transformed(52, 281, string_hash_to_newline("* You feel like you're not gonna get #copyrighted."), 2, 2, 0)
	//could have just deleted it tbh
}

if State = State_Fight or State = State_Act_Enemy_Select
{

	
	array_foreach(Enemy_Count,function(enemy, _index) // Loops through each enemy
	{
			draw_text_transformed(90, 265+(_index*30), "* "+enemy.name, 2, 2, 0);
	})
		
	
}

if(State = State_Quicktime)
{
draw_sprite(spr_battle_quicktime, 0, 32, 250);
draw_sprite(spr_battle_attack_bar, 0, 16 + Quicktime_Pos, 322.5);
draw_sprite(spr_debug_pixel,0,319,319.5);
}

if State = State_Act_Select
{

	var enemy = Enemy_Count[Enemy_select_Index];
	if ActSelected = false
	{
		array_foreach(enemy.act_actions,function(act, _index) // Loops through each enemy
		{
			draw_text_transformed(90, 265+(_index*30), "* "+act.Name, 2, 2, 0);
		})
	}
	else
	{
		draw_text_transformed(52, 265, "* "+string_hash_to_newline(enemy.act_actions[Act_Index].Description), 2, 2, 0)
	}
		
	
}
