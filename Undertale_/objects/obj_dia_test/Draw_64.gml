/// @description Insert description here
// You can write your code in this editor

message_actual = string_copy(full_text, 0, cutoff);

//view_get_camera()


//Can someone better figure out the boxes, and the positioning of them and the text.
//I'm too tired right now
draw_set_color(c_white);
draw_sprite(spr_text_box,-1,30,camera_get_view_height(camera_get_active())-sprite_height-10);
draw_set_colour(c_white);
draw_set_font(Font1);

//this draws the text, since it updates every frame the message will procedulary(is that how you spell it?) type
draw_text_ext(88,200,string_hash_to_newline(message_actual),18,-1);

//a