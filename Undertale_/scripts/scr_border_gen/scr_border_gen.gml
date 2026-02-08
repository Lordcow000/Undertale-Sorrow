// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_border_gen(){
	instance_create_layer(0,0,"Instances",obj_border_up);
	instance_create_layer(0,0,"Instances",obj_border_down);
	instance_create_layer(0,0,"Instances",obj_border_left);
	instance_create_layer(0,0,"Instances",obj_border_right);
}