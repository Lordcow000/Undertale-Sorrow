/// @description Insert description here
// You can write your code in this editor
if (x > global.idealborder[1] || x < global.idealborder[0])
{
	instance_destroy();
}

if (y+sprite_width > global.idealborder[3])
{
	instance_destroy();
}

