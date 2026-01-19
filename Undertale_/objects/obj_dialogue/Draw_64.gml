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

draw_set_font(Font1);
draw_set_color(c_white);

var clean_text = string_copy(dialogue_list[text_current], 1, char_current);


for(i=0;i <= 9; i++)
{
	clean_text = string_replace_all(clean_text, "/"+string(i), "");
}

if(!array_length(dialogue_list) <= text_current)
{
 

if (!Portrait)
{

draw_text_transformed(text_x, text_y, string_hash_to_newline(clean_text),2,2,0);

}

else
{
var dialogue_port = dialogue_list[text_current].Portrait
draw_sprite_ext(dialogue_port,0,text_x,text_y,2,2,0,c_white,1);
draw_text_transformed(text_x + (sprite_get_width(dialogue_port)*2+15), text_y,  string_hash_to_newline(clean_text),2,2,0);		
}
}

if (choice == false) //PREVENTS THE CODE FROM GOING ON UNLESS A CHOICE CAN BE MADE
    exit;

var spacing = 0.5;

if (ch[4] != "")
    spacing = 1;

if (Portrait)
    spacing = 0.30;

var ypos1, ypos2;

if (position == 0)
{
    ypos1 = 380;
    
    if (ch[3] == "")
    {
        var y_offset = max(string_height(ch[1]) - 8, string_height(ch[2]) - 8);
        ypos1 = 420 - y_offset;
    }
    
    ypos2 = 420;
}

xx = 380;

if (ch[4] != "" || ch[2] != "")
    xx = 168;

var width1 = string_width(string_hash_to_newline(ch[1]));
var width2 = string_width(string_hash_to_newline(ch[2]));
var xpos1 = xx - width1;

if (portrait == true)
{
    if (ch[2] != "")
        xpos1 += 100;
    else
        xpos1 += 40;
}

var xpos2 = 472 - width2;
var xpos3 = xpos1;
var xpos4 = xpos2;
draw_set_alpha(ch_alpha);

if (char_current >= string_length(dialogue_list[text_current]))
{
    draw_set_halign(fa_left);
    
    if (ch[4] != "")
        draw_set_halign(fa_left);
    
    draw_text_transformed(xpos1, ypos1, string_hash_to_newline(ch[1]),2,2,0);
    
    if (ch[2] != "")
        draw_text_transformed(xpos2, ypos1, string_hash_to_newline(ch[2]),2,2,0);
    
    if (ch[3] != "")
        draw_text_transformed(xpos3, ypos2, string_hash_to_newline(ch[3]),2,2,0);
    
    if (ch[4] != "")
        draw_text_transformed(xpos4, ypos2, string_hash_to_newline(ch[4]),2,2,0);
    
    draw_set_halign(fa_center);
    var soul_offset = 0;
    
    if (ch[4] != "")
        soul_offset = 0;
    
    var soul_x, soul_y;
    
    switch (p)
    {
        case 1:
            soul_x = xpos1 - soul_offset - 20;
            soul_y = ypos1 + 8;
            break;
        
        case 2:
            soul_x = xpos2 - soul_offset - 16;
            soul_y = ypos1 + 8;
            break;
        
        case 3:
            soul_x = xpos3 - soul_offset - 16;
            soul_y = ypos2 + 8;
            break;
        
        case 4:
            soul_x = xpos4 - soul_offset - 16;
            soul_y = ypos2 + 8;
            break;
    }
    
    draw_sprite(spr_heart, 0, soul_x, soul_y);
}

draw_set_alpha(1);
draw_set_halign(fa_left);