/// @description Insert description here
// You can write your code in this editor
var text_x = global.idealborder[0] + 20;
var text_y = global.idealborder[2] + 20;


var clean_text = string_copy(_message[text_current], 1, char_current);


for(i=0;i <= 9; i++)
{
	clean_text = string_replace_all(clean_text, "/"+string(i), "");
}

if(!array_length(_message) <= text_current)
{
	draw_text_transformed(text_x, text_y, string_hash_to_newline(clean_text),2,2,0);
}