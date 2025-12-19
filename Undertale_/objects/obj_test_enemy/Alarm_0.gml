/// @description Insert description here
// You can write your code in this editor
show_debug_message("Yeah")
randomise();
var spawn = random_range(global.idealborder[0], global.idealborder[1]);
bullet = instance_create_layer(spawn,global.idealborder[2],"Instances",obj_test_bullet);
alarm[0] = 60;

