/// @description Insert description here
// You can write your code in this editor
event_inherited();
randomise();
dmg = 1;
is_blue = false;
is_orange = false;
attacking = false;
bob_direction = 1;
bob_speed = 3;

left = global.idealborder[0] - 30;
right = global.idealborder[1] + 30;
top = global.idealborder[2] + 5;
bottom = global.idealborder[3] - 10;

side = choose(0,1);

if (side == 1)
{
	x = right;
}
else
{
	x = left;
}

bob_range = bottom - top;

alarm[0] = random_range(2,5)*60;