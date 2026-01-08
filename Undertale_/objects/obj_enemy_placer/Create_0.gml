/// @description Insert description here
// You can write your code in this editor

enemies = global.BattleEnemies;
amt_of_enemies = array_length(enemies);

show_debug_message("Enemeis" + string(enemies));

switch amt_of_enemies
{
	case 1:
	instance_create_layer(obj_e_2.x,obj_e_2.y,"Instances",enemies[0]);
	show_debug_message("1")
	break
	
	case 2:
	instance_create_layer(obj_e_1.x,obj_e_1.y,"Instances",enemies[0]);
	instance_create_layer(obj_e_3.x,obj_e_3.y,"Instances",enemies[1]);
	show_debug_message("2")
	break
	
	case 3:
	instance_create_layer(obj_e_1.x,obj_e_1.y,"Instances",enemies[0]);
	instance_create_layer(obj_e_2.x,obj_e_2.y,"Instances",enemies[1]);
	instance_create_layer(obj_e_3.x,obj_e_3.y,"Instances",enemies[2]);
	show_debug_message("3")
	break
}
