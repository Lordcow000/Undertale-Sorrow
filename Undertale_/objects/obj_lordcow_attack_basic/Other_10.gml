/// @description Insert description here
// You can write your code in this editor
randomise();
var spawn = random_range(global.idealborder[0], global.idealborder[1]);//get random x position along the top border
bullet = instance_create_layer(spawn,global.idealborder[2],"Instances",blt_basic);//create bullet with rand x and y of top border


alarm[0] = spawn_delay;