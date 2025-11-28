
/// @description Insert description here
// You can write your code in this editor
if(array_length(Dialog_List) < 1)
{
obj_mainchara.State = obj_mainchara.State_Overworld;
instance_destroy();
}
else
{
draw_set_font(Font1);
draw_rectangle_colour(1, 470, browser_width, browser_height / 1.5, c_black, c_black, c_black, c_black, false);
draw_rectangle_colour(1, 470, browser_width, browser_height / 1.5, c_white, c_white, c_white, c_white, true);
draw_rectangle_colour(1, 420, browser_width, browser_height, c_black, c_black, c_black, c_black, false);
draw_rectangle_colour(1, 420, browser_width, browser_height, c_white, c_white, c_white, c_white, true);
if(string_length(Dialog_List[0].Text) > Current_Char)
{
Current_Char ++;
if(keyboard_check_pressed(ord("Z")))
{
Current_Char = string_length(Dialog_List[0].Text);
}
}
else
{
if(keyboard_check_pressed(ord("Z")))
{
if(string_length(Dialog_List[0].Text) = Current_Char)
{
array_delete(Dialog_List, 0, 1);
Current_Char = 0;
}
}
}
if(array_length(Dialog_List) < 1)
{
obj_mainchara.State = obj_mainchara.State_Overworld;

if(array_length(Dialog_List) <= 0)
{
instance_destroy();
}
else
{
draw_set_colour(c_white);
draw_text_ext_transformed(browser_width / 4, 330, "* " + string_copy(Dialog_List[0].Text, 1, Current_Char), 20, 220, 2, 2, 0);
}
}
draw_text_ext_transformed(browser_width / 4, browser_height / 1.7, "* " + string_copy(Dialog_List[0].Text, 1, Current_Char), 20, room_width - 8, 2, 2, 0);
}
