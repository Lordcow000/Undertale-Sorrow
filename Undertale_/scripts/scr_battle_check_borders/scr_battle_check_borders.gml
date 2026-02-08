// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_battle_check_borders()
{
	if
	(
	obj_border_down.finished == true &&
	obj_border_left.finished == true &&
	obj_border_right.finished == true &&
	obj_border_up.finished == true
	)
	{
		show_debug_message("AAAAAAAAA")
		return true
	}
	else 
	return false

}