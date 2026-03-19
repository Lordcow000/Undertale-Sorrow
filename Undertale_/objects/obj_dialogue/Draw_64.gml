/// @description Insert description here
// You can write your code in this editor
var x1 = 32;
var y1 = 320;
var x2 = 608;
var y2 = 470;

var xx = 60;

draw_set_color(c_white);
draw_rectangle(x1, y1, x2, y2, false);

draw_set_color(c_black);
draw_rectangle(x1 + 6, y1 + 6, x2 - 6, y2 - 6, false);

draw_set_font(fnt_main);
draw_set_color(c_white);

var clean_text = string_copy(dialogue_list[text_current], 1, char_current);
var clean_colour_text = string_copy(dialogue_list_colour[text_current].text, 1, char_current);


for(i=0;i <= 9; i++)
{
	clean_text = string_replace_all(clean_text, "/W"+string(i), "");
}

if(!array_length(dialogue_list) <= text_current)
{
 

if (!portrait)
{

draw_text_transformed(text_x, text_y, string_hash_to_newline(clean_text),2,2,0);
}
if(colour = true)
{
draw_set_colour(dialogue_list_colour[text_current].colour);

draw_text_transformed(text_x, text_y, string_hash_to_newline(clean_colour_text), 2, 2, 0);
draw_set_colour(c_white);
//                            Just testing
// just fixin'

}

else
{
	var dialogue_port = prt[text_current];
	show_debug_message(dialogue_port);
	show_debug_message("^")
	if(dialogue_port != false)
	{
		draw_sprite_ext(dialogue_port,0,text_x,text_y,2,2,0,c_white,1);
		draw_text_transformed(text_x + (sprite_get_width(dialogue_port)*2+15), text_y,  string_hash_to_newline(clean_text),2,2,0);		
	}
	else
	{
		draw_text_transformed(text_x, text_y, string_hash_to_newline(clean_text),2,2,0);
	}
}
}

if (choice == false)
    exit;

scr_choicer_draw();

draw_set_alpha(1);
draw_set_halign(fa_left);