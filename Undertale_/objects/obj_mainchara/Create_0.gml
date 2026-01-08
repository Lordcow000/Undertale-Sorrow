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

// move this code later

State_Battle = function()
{

}


array_push(global.Game_Data.Inventory_1, ItemID.Lime);
array_push(global.Game_Data.Inventory_1, ItemID.Lemon);
array_push(global.Game_Data.Inventory_1, ItemID.Lemon_Lime_Bitters);


//Item = 
//{
//Display_Name: "Lemon",
//Name: "Lemon",
//Type: "Food",
//Value: 20,
//Description: "A yellow fruit, really REALLY sour. Heals 10 HP."
//}

//array_push(global.Game_Data.Inventory_1, Item);
//Item = 
//{
//Display_Name: "Limon Bitt",
//Name: "Lemon Lime Bitters",
//Type: "Food",
//Value: 100,
//Description: "The best drink. Heals 100 HP!"
//}

MenuSelect = ["ITEM", "STAT", "CELL"]

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

State_Inventory = function()
{
var Down = keyboard_check_pressed(vk_down);
var Up = keyboard_check_pressed(vk_up);
var Select = keyboard_check_pressed(ord("Z"));
var _inventory = global.Game_Data.Inventory_1;
if(keyboard_check_pressed(ord("C"))) or (keyboard_check_pressed(vk_control))
{
State = State_Overworld;
}
if(keyboard_check_pressed(ord("X"))) or (keyboard_check_pressed(vk_shift))
{
State = State_Menu;
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

if(Select)
{
Current_Item = _inventory[Inventory_Index];
State = State_Inventory_2;
}

}

State_Inventory_2 = function()
{
var Left = keyboard_check_pressed(vk_left);
var Right = keyboard_check_pressed(vk_right);
var Select = keyboard_check_pressed(ord("Z"));

if(Select)
{
if(Item_Actions[Item_Action_Index] = "INFO")
{
var _dialog = instance_create_layer(x, y, "Instances", obj_dia_test_new);

//Text: global.Game_Data.Inventory_1[other.Inventory_Index].Description
Dialog_List[0] = Fetch_item(global.Game_Data.Inventory_1[Inventory_Index]).desc
with(_dialog)
{
Dialog_List = other.Dialog_List;
Dialog_List[0].Text = string_wrap(Dialog_List[0].Text, text_width);
}

State = State_Talking;
show_debug_message(Item_Action_Index);
}

}

if(Select)
{
if(Item_Actions[Item_Action_Index] = "DROP")
{
var _dialog = instance_create_layer(x, y, "Instances", obj_dia_test_new);
Dialog_List[0] = {Text:"* The " +  Fetch_item(global.Game_Data.Inventory_1[Inventory_Index]).name+ " was thrown away."}
with(_dialog)
{
	Dialog_List = other.Dialog_List;
	Dialog_List[0].Text = string_wrap(Dialog_List[0].Text, text_width);



}
State = State_Talking;
show_debug_message(Item_Action_Index);
array_delete(global.Game_Data.Inventory_1, Inventory_Index, 1);
}
if(Item_Actions[Item_Action_Index] = "USE")
{
if(global.Game_Data.Inventory_1[Item_Action_Index].Type = "Food")
{
global.Health += global.Game_Data.Inventory_1[Item_Action_Index].Value;
if(global.Health >= global.MaxHealth)
{
global.Health = global.MaxHealth;
var _dialog = instance_create_layer(x, y, "Instances", zold_dialogue_DONT_USE);
with(_dialog)
{
Dialog_List = [];
Dialog = 
{
Text: "The " + global.Game_Data.Inventory_1[other.Inventory_Index].Name + " was consumed. You healed to full!"
//more stuff will be added like talking sprites
}
array_push(Dialog_List, Dialog);
}
State = State_Talking;
show_debug_message(Item_Action_Index);
array_delete(global.Game_Data.Inventory_1, Inventory_Index, 1);
}
else
{
var _dialog = instance_create_layer(x, y, "Instances", zold_dialogue_DONT_USE);
with(_dialog)
{
Dialog_List = [];
Dialog = 
{
Text: "The " + global.Game_Data.Inventory_1[other.Inventory_Index].Name + " was consumed. You healed " + global.Game_Data.Inventory_1[other.Inventory_Index].Value + " HP!"
//more stuff will be added like talking sprites
}
array_push(Dialog_List, Dialog);
}
State = State_Talking;
show_debug_message(Item_Action_Index);
array_delete(global.Game_Data.Inventory_1, Inventory_Index, 1);
}
}
}
}

if(Right)
{
Item_Action_Index ++;
if(Item_Action_Index > array_length(Item_Actions) - 1)
{
Item_Action_Index = 0;
}
}
if(Left)
{
Item_Action_Index --;
if(Item_Action_Index < 0)
{
Item_Action_Index = array_length(Item_Actions) - 1;
}
}

if(keyboard_check_pressed(ord("X"))) or (keyboard_check_pressed(vk_shift))
{
State = State_Inventory;
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
	if(array_length(global.Game_Data.Inventory_1) != 0)
	{
	State = State_Inventory
	}

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
	enemies_spawned = false
	if(keyboard_check_pressed(ord("C"))) or (keyboard_check_pressed(vk_control))
{
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
if Run = true
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
	var cooldowninteract = time_source_create(time_source_global, 0.1, time_source_units_seconds, interactready)
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

State = State_Overworld;

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




