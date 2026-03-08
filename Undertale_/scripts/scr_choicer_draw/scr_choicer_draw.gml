// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_choicer_draw(){
	var spacing = 0.5;

	if (ch[4] != "")
	    spacing = 1;

	if (portrait)
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
}