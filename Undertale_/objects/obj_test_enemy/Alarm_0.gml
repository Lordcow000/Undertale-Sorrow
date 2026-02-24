/// @description Insert description here
// You can write your code in this editor
randomise();
var spawn = random_range(global.idealborder[0], global.idealborder[1]);
bullet = instance_create_layer(spawn,global.idealborder[2],"Instances",blt_basic);
bullet.is_blue = true;
if global.TurnTimer > 0
{
	alarm[0] = 60;
}
else
{
	instance_destroy(bullet);
}
