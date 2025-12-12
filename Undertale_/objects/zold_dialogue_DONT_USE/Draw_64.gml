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
//draw_rectangle_colour(1, 470, browser_width, browser_height / 1.5, c_black, c_black, c_black, c_black, false);
//draw_rectangle_colour(1, 470, browser_width, browser_height / 1.5, c_white, c_white, c_white, c_white, true);



var x1 = 32;
var y1 = 320;
var x2 = 608;
var y2 = 470;

draw_set_color(c_white);
draw_rectangle(x1, y1, x2, y2, false);

draw_set_color(c_black);
draw_rectangle(x1 + 6, y1 + 6, x2 - 6, y2 - 6, false);



current_text = string_copy(Dialog_List[0].Text, 1, Current_Char);

if (! just_advanced)
{
if(string_length(Dialog_List[0].Text) > Current_Char)
{
Current_Char ++;
if(keyboard_check_pressed(ord("X")))
{
show_debug_message("AHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH")

Current_Char = string_length(Dialog_List[0].Text);

}
}
}
if (string_length(Dialog_List[0].Text) == Current_Char)
{
if(keyboard_check_pressed(ord("Z")))
{
Current_Char = 0;
array_delete(Dialog_List, 0, 1);
just_advanced = true

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
draw_text_ext_transformed(56, 340, "* " + current_text, 20, 300, 2, 2, 0);
}
}
}