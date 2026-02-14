/// @description Insert description here
// You can write your code in this editor
image_speed = 0;

sprite_index = spr_LORDCOW;

ddd = instance_create_layer(x,y,"Instances",obj_vaporized);

ddd.sprite_index = sprite_index;

ddd.ht = sprite_height; //Height
ddd.wd = sprite_width;

ddd.image_speed = 0;
ddd.image_index = 1;

visible = false;
alarm[0] = 100;
