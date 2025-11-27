/// @description Insert description here
// You can write your code in this editor

draw_rectangle_colour(1, 420, 1366, 768, c_black, c_black, c_black, c_black, true);
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

if(array_length(Dialog_List) <= 0)
{
instance_destroy();
}
else
{
draw_set_colour(c_white);
draw_text(400, 400, string(array_length(Dialog_List)));
draw_text_ext_transformed(300, 440, "* " + string_copy(Dialog_List[0].Text, 1, Current_Char), 20, 1366, 2, 2, 0);
}
