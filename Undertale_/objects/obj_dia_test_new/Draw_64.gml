/// @description Insert description here
// You can write your code in this editor
var x1 = 32;
var y1 = 320;
var x2 = 608;
var y2 = 470;

draw_set_color(c_white);
draw_rectangle(x1, y1, x2, y2, false);

draw_set_color(c_black);
draw_rectangle(x1 + 6, y1 + 6, x2 - 6, y2 - 6, false);

draw_set_font(Font1);

if(!array_length(dialogue_list) <= text_current)
{
 

var _len = string_length(dialogue_list[text_current])
var current_char = string_copy(dialogue_list[text_current].Text,char_current,1);
var next_char = string_copy(dialogue_list[text_current].Text,char_current+1,1);
var next_char_2 = string_copy(dialogue_list[text_current].Text,char_current+2,1);
var next_char_3 = string_copy(dialogue_list[text_current].Text,char_current+3,1);

if (array_contains(pauses,current_char) && !waited)
{
	waited = true;
	paused = true;
	alarm[0] = 10;
}

if (next_char == "/")
{
	switch next_char_2
	{
		case "W":
		if(!waited_custom)
		{
			waited_custom = true;
			paused = true;
			alarm[0] = real(next_char_3)*60;
			dialogue_list[text_current].Text = string_delete(dialogue_list[text_current].Text,char_current+1,3);
		}
		
		
		
	}
	
}

if (char_current < _len && !paused)
    {
	waited = false;
	waited_custom = false;
    char_current += char_speed;
    }

if (Portrait != true)
{
	
draw_set_color(c_white);
var _str = string_copy(dialogue_list[text_current].Text, 1, char_current);
draw_text_transformed(text_x, text_y,  _str,2,2,0);

}

else
{
var dialogue_port = dialogue_list[text_current].Portrait
draw_set_color(c_white);
var _str = string_copy(dialogue_list[text_current].Text, 1, char_current);
draw_sprite_ext(dialogue_port,0,text_x,text_y,2,2,0,c_white,1);
draw_text_transformed(text_x + (sprite_get_width(dialogue_port)*2+15), text_y,  _str,2,2,0);		
}
}
