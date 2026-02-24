// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_multicheck_held(arg)
{
	if (arg = 0)
	{
		if (keyboard_check(vk_enter) || keyboard_check(ord("Z")))
            return true;
	}
	
	if (arg = 1)
	{
		if (keyboard_check(vk_shift) || keyboard_check(ord("X")))
            return true;
	}
	
	if (arg = 2)
	{
		if (keyboard_check(vk_control) || keyboard_check(ord("C")))
            return true;
	}



}