/// @description Insert description here
// You can write your code in this editor
enemy_type = global.testenemies
ready = true
Run = false
xSpeed = 0;
ySpeed = 0;
Speed = 3;
facing = 0;
Selection = 1;
Encounter_Chance = 0;
Encounter_Chance_Counter = 0;
Current_Item = {};
Item_Actions = ["USE", "INFO", "DROP"];
Item_Action_Index = 0;


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


scr_item_add(ItemID.Lemon)
scr_item_add(ItemID.Lime);
scr_item_add(ItemID.Lemon_Lime_Bitters);
scr_item_add(ItemID.Stick)





State_Battle = function()
{

}

State_Battle_Start = function()
{
Encounter_Chance ++;
if(Encounter_Chance >= 60)
{
	Encounter_Chance = 0;
	encounter = true;
global.Game_Data.PlayerStartxPos = x;
global.Game_Data.PlayerStartyPos = y;
global.Game_Data.Previ_Room = room;
enemies = [];
randomise();
enemy_amount = irandom_range(1, 3);
show_debug_message("random amount: "+ string(enemy_amount))
for (var i = 0; i < enemy_amount; i++)
{
	enemy = (enemy_type[irandom(array_length(enemy_type) - 1)]);
	show_debug_message(enemy);
	array_push(enemies, enemy);
}
global.BattleEnemies = enemies;

room_goto(encounter_room);
//instance_create_layer(50,50,"Instances",obj_enemy_placer);
show_debug_message("Enemeis seemingly spawned")


}
}

State_Menu = function()
{
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

State_Overworld = function()
{
	enemies_spawned = false
	if(scr_multicheck_pressed(2))
	{
		instance_create_layer(x,y,"Instances",obj_pause_menu);
		State = State_Menu;
	}
	
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
	
	if Run == true
	{
		Speed = 3;
		image_speed = 6;
	}
	else
	{
		Speed = 1;
		image_speed = 3;
	}
	var interactready = function()
	{
		ready = true
	}
	if (scr_multicheck_pressed(0) and ready = true)
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
		var cooldowninteract = time_source_create(time_source_global, 0.1, time_source_units_seconds, interactready)
		time_source_start(cooldowninteract)

	}

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

	if(xSpeed != 0 or ySpeed != 0)
	{
		Encounter_Chance_Counter ++;
		if(Encounter_Chance_Counter >= 300)
		{
		Encounter_Chance ++;
		var _rand = irandom_range(0, 100)
		{
		if(_rand < Encounter_Chance)
		{
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
	State = State_Battle_Start;
	Encounter_Chance = 0;
	Encounter_Chance_Counter = 0;
		}
		}
		}
	}

}

State_Talking = function()
{
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

State = State_Overworld;


