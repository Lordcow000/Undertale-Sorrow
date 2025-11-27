/// @description Insert description here
// You can write your code in this editor

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
}
}
}

draw_text_ext_transformed(32, 800, string_copy(Dialog_List[0].Text, 1, Current_Char), 20, 1366, 2, 2, 0);

