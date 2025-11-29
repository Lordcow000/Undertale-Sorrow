Health = 20;
global.MaxHealth = 20;
ready = true;
Run = false;
xSpeed = 0;
ySpeed = 0;
Speed = 1;
facing = 0;
Selection = 1;
global.LOVE = 1;
global.Attack = 0;
WeaponAtk = 0;
global.Defense = 0;
ArmorDef = 0;
global.EXP = 0;
NEXTLV = 10;
global.Weapon = "Fists";
global.Armor = "Nothing";
global.Money = 0;

d_idle = temp_idle_down;
u_idle = temp_idle_up;
r_idle = temp_idle_right;
l_idle = temp_idle_left;

d_move = temp_move_down;
u_move = temp_move_up;
r_move = temp_move_right;
l_move = temp_move_left;

hold_right = 0;
hold_left  = 0;
hold_up    = 0;
hold_down  = 0;

last_dir = "down";

Inventory_Index = 0;
Menu_Index = 0;

// move this code later
global.Game_Data = 
{
Inventory_1: []
}

Item = 
{
Name: "Lime",
Type: "Food",
Value: 10,
Description: "A green fruit, really sour.#Heals 10 HP"
}

array_push(global.Game_Data.Inventory_1, Item);

MenuSelect = ["Item", "Stats", "Cellphone"]

State_Stat = function()
{
	if(keyboard_check_pressed(ord("C"))) or (keyboard_check_pressed(vk_control))
{
State = State_Overworld;
}
if(keyboard_check_pressed(ord("X"))) or (keyboard_check_pressed(vk_shift))
{
State = State_Menu
}
}

State_Inventory = function()
{
var Down = keyboard_check_pressed(vk_down);
var Up = keyboard_check_pressed(vk_up);
var _inventory = global.Game_Data;
if(keyboard_check_pressed(ord("C"))) or (keyboard_check_pressed(vk_control))
{
State = State_Overworld;
}
if(keyboard_check_pressed(ord("X"))) or (keyboard_check_pressed(vk_shift))
{
State = State_Menu
}

if(Down)
{

Inventory_Index ++;
if(Inventory_Index > array_length(_inventory) - 1)
{
Inventory_Index = 0;
}
}


if(Up)
{
Inventory_Index --;
if(Inventory_Index < 0)
{
Inventory_Index = array_length(_inventory) - 1;
}
}

}
State_Menu = function()
{
var Down = keyboard_check_pressed(vk_down);
var Up = keyboard_check_pressed(vk_up);
if(keyboard_check_pressed(ord("C"))) or (keyboard_check_pressed(ord("X"))) or (keyboard_check_pressed(vk_shift)) or (keyboard_check_pressed(vk_control))
{
	State = State_Overworld
}
if((keyboard_check_pressed(ord("Z"))) or (keyboard_check_pressed(vk_enter)))
{
switch(Menu_Index) 
{
	case 0:
	State = State_Inventory
	break
	case 1:
	State = State_Stat
	break
}
}
if(Down)
{
	Menu_Index ++
	if(Menu_Index > array_length(MenuSelect) - 1)
	{
		Menu_Index = 0
	}
}
if(Up)
{
	Menu_Index --
	if(Menu_Index < 0)
	{
		Menu_Index = array_length(MenuSelect) - 1
	}
}
}



State_Overworld = function()
{
/*how these two work is keyboard_check is either positive (the key is being pressed(1)) or neutral (the key is not being pressed (0))
it then subtracts these values to get which direction you are moving. For example, if left is being pressed but not right it would return -1,
meaning in xSpeed = xDirection * Speed it would be xSpeed = -1 * Speed (5) making the player move left.
*/
var xDirection = keyboard_check(vk_right) - keyboard_check(vk_left);
var yDirection = keyboard_check(vk_down) - keyboard_check(vk_up);


//these get how long a direction key has been held down for
hold_right = keyboard_check(vk_right) ? hold_right + 1 : 0;
hold_left  = keyboard_check(vk_left)  ? hold_left  + 1 : 0;
hold_up    = keyboard_check(vk_up)    ? hold_up    + 1 : 0;
hold_down  = keyboard_check(vk_down)  ? hold_down  + 1 : 0;



//Check if player is moving
if (xDirection != 0 || yDirection != 0)
{
	// We have to get the direction while we're moving, or else it'll default to the downward idle
	longest_held = max(hold_right,hold_left,hold_up,hold_down);
	if (longest_held == hold_right)  last_dir = "right";
	if (longest_held == hold_left)   last_dir = "left";
	if (longest_held == hold_up)     last_dir = "up";
	if (longest_held == hold_down)   last_dir = "down";
	
	//Get move direction
	switch(last_dir)
	{
		case "right":
			sprite_index = r_move;
			break;
		case "left": 
			sprite_index = l_move;
			break;
		case "up":
			sprite_index = u_move;
			break;
		case "down":
			sprite_index = d_move;
			break;
	}	
}

else
{
	//Get idle direction
	switch(last_dir)
	{
		case "right":
			sprite_index = r_idle;
			break;
		case "left": 
			sprite_index = l_idle;
			break;
		case "up":
			sprite_index = u_idle;
			break;
		case "down":
			sprite_index = d_idle;
			break;
	}
}

if (keyboard_check(vk_shift) or keyboard_check(ord("X")))
{
	Run = true
}
else
{
	Run = false
}
if Run = true
{
	Speed = 3;
}
else
{
	Speed = 1;
}
var interactready = function()
{
	ready = true
}
if ((keyboard_check_pressed(ord("Z")) or (keyboard_check_pressed(vk_enter))) and ready = true)
{
	switch(last_dir)
	{
		case "right":
		instance_create_layer(x + 20, y + 20, "Instances", obj_interactcollision)
		break
		case "left":
		instance_create_layer(x - 20, y + 20, "Instances", obj_interactcollision)
		break
		case "up":
		instance_create_layer(x, y, "Instances", obj_interactcollision)
		break
		case "down":
		instance_create_layer(x, y + 40, "Instances", obj_interactcollision)
		break
	}
	ready = false
	var cooldowninteract = time_source_create(time_source_global, 0.5, time_source_units_seconds, interactready)
	time_source_start(cooldowninteract)

}

/*having xSpeed and ySpeed variables are useful as it makes sure the player's speed stays consistent throughout the step
and can be modified
*/
xSpeed = xDirection * Speed;
ySpeed = yDirection * Speed;

if(keyboard_check_pressed(ord("C"))) or (keyboard_check_pressed(vk_control))
{
State = State_Menu;
}

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

State_Talking = function()
{

}
