// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_defeat()
{
	image_speed = 0;
	ddd = instance_create_layer(x,y,"Instances",obj_vaporized);

	ddd.sprite_index = sprite_index;

	ddd.ht = sprite_height; //Height
	ddd.wd = sprite_width;

	ddd.image_speed = 0;
	ddd.image_index = 1;
}