// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_check_borders()
{
	
	borders = [obj_border_down, obj_border_up, obj_border_right, obj_border_left];
	
	show_debug_message(obj_border_down.finished);
	show_debug_message(obj_border_up.finished);
	show_debug_message(obj_border_left.finished);
	show_debug_message(obj_border_right.finished);

	
	
	for (var i = 0; i < array_length(borders); i++)
    {
        if (!borders[i].finished)
        {
            return false;
        }
    }
	
	return true
	

}