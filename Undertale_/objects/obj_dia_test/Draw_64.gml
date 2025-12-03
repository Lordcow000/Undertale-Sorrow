/// @description Insert description here
// You can write your code in this editor
show_debug_message(array_length(Dialog_List));
if(array_length(Dialog_List) < 1)
{
obj_mainchara.State = Player_Next_State;
instance_destroy();
}
else
{
draw_set_font(Font1);
draw_rectangle_colour(1, 470, browser_width, browser_height / 1.5, c_black, c_black, c_black, c_black, false);
draw_rectangle_colour(1, 470, browser_width, browser_height / 1.5, c_white, c_white, c_white, c_white, true);
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
obj_mainchara.State = Player_Next_State;
instance_destroy();
}
else
{
draw_set_colour(c_white);
if(Has_Sprite = 1)
{
draw_text_ext_transformed(160, 330, "* " + string_copy(Dialog_List[0].Text, 1, Current_Char), 20, 220, 2, 2, 0);
}
else
{
draw_text_ext_transformed(22, 330, "* " + string_copy(Dialog_List[0].Text, 1, Current_Char), 20, 348, 2, 2, 0);
}
}
}