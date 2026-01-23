// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_multicheck_pressed(arg)
{
	if (arg = 0)
	{
		if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
            return true;
	}
	
	if (arg = 1)
	{
		if (keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X")))
            return true;
	}
	
	if (arg = 2)
	{
		if (keyboard_check_pressed(vk_control) || keyboard_check_pressed(ord("C")))
            return true;
	}



}