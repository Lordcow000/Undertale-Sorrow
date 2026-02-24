/// @description Insert description here
// You can write your code in this editor
global.instantborder = false;
scr_new_border(237, 397, 200, 385);

spawn_delay = 20;
alarm[1] = 500;//Attack timer
alarm[0] = 30;


milk_capacity = 0;
milk_gain_rate = 5;

milk = instance_create_layer(global.idealborder[0]+5, global.idealborder[3],"Instances",obj_milk_bullet);



