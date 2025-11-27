/// @description Insert description here
// You can write your code in this editor

if(string_length(Dialog_List[0].Text) > Dialog_List[0].Current_Char)
{
Dialog_List[0].Current_Char ++;
if(keyboard_check_pressed(ord("Z")))
{
Dialog_List[0].Current_Char = string_length(Dialog_List[0].Text);
}
}
else
{
if(keyboard_check_pressed(ord("Z")))
{
if(string_length(Dialog_List[0].Text) = Dialog_List[0].Current_Char)
{
array_delete(Dialog_List, 0, 1);
}
}
}

