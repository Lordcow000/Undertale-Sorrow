/// @description Insert description here
// You can write your code in this editor
xSpeed = 0;
ySpeed = 0;
Speed = 5;
facing = 0;

d_idle = temp_idle_down;
u_idle = temp_idle_up;
r_idle = temp_idle_right;
l_idle = temp_idle_left;

d_move = temp_move_down;
u_move = temp_move_up;
r_move = temp_move_right;
l_move = temp_move_left;

State_Overworld = function()
{
/*how these two work is keyboard_check_direct is either positive (the key is being pressed(1)) or neutral (the key is not being pressed (0))
it then subtracts these values to get which direction you are moving. For example, if left is being pressed but not right it would return -1,
meaning in xSpeed = xDirection * Speed it would be xSpeed = -1 * Speed (5) making the player move left.
*/
var xDirection = keyboard_check_direct(vk_right) - keyboard_check_direct(vk_left);
var yDirection = keyboard_check_direct(vk_down) - keyboard_check_direct(vk_up);

/*having xSpeed and ySpeed variables are useful as it makes sure the player's speed stays consistent throughout the step
and can be modified
*/
xSpeed = xDirection * Speed;
ySpeed = yDirection * Speed;


//call these variables (or at least x += xSpeed and y += ySpeed) last or after any speed checks are made.

if(place_meeting(x + xSpeed, y, obj_wall))
{
	xSpeed = 0;
}

x += xSpeed;

if(place_meeting(x, y + ySpeed, obj_wall))
{
	ySpeed = 0;
}

y += ySpeed;
}

State = State_Overworld;


