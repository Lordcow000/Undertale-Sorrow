items = global.Game_Data.Inventory_1
Selec_Index = 0;
Selec = ["FIGHT", "ACT", "ITEM", "MERCY"]
Enemy_Count = []
Dialog = "I'll solve it later blah"
Current_Char = 0;
Quicktime_Pos = 0;
Enemy_select_Index = 0;
Act_Index = 0;
Act_Grid_x = 0;
Act_Grid_y = 0;
Mercy_Index = 0;
Mercy_Select = ["Spare", "Flee"];
started = false;
image_speed = 0;

global.instantborder = true;
global.idealborder[0] = 32;
global.idealborder[1] = 602;
global.idealborder[2] = 250;
global.idealborder[3] = 385;

State_Selec = function()
{
	global.idealborder[0] = 32;
	global.idealborder[1] = 602;
	global.idealborder[2] = 250;
	global.idealborder[3] = 385;
	global.instantborder = false  ;
	var right = keyboard_check_pressed(vk_right)
	var left = keyboard_check_pressed(vk_left)
	if(right)
	{
		Selec_Index ++;
		if(Selec_Index > array_length(Selec) - 1)
		{
			Selec_Index = 0
		}
	}
	if(left)
	{
		Selec_Index --;
		if(Selec_Index < 0)
		{
			Selec_Index = array_length(Selec) - 1
		}
	}
	if(keyboard_check_pressed(ord("Z"))) or (keyboard_check_pressed(vk_enter))
	{
		switch(Selec_Index)
		{
			case 0:
			State = State_Fight;
			break
			
			case 1:
			State = State_Act_Enemy_Select;
			break
			
			case 3:
			State = State_Mercy;
			break
		}
	}
	switch(Selec_Index)
	{
		case 0:
		x = 40
		y = 446
		break
		case 1:
		x = 193
		y = 446
		break
		case 2:
		x = 353
		y = 446
		break
		case 3:
		x = 508
		y = 446
		break
	}
}

State_Quicktime = function()
{
	var z = (keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter));
	var center_x = 319;
	_accuracy_multi=1
	
	if(z)
	{
		
		
		var _distance_from_center = abs(center_x - Quicktime_Pos); 
		if (_distance_from_center <= 12)
		{
			_accuracy_multi = 2.2
		}
		else
		{
			_accuracy_multi = (1-_distance_from_center/(view_wport/2))*2  //287 is half the width of spr_battle_quicktime
		}
		
		var enemy = Enemy_Count[Enemy_select_Index];
		
		var _damage = ceil(round(global.Game_Data.Attack - enemy.def + random(2)) * _accuracy_multi)
		
		show_debug_message(_damage);
		
		enemy._health -= _damage; 
		
		if (enemy._health <= 0)
		{
			array_delete(Enemy_Count,Enemy_select_Index,1); // removes enemy if dead
		}
		show_debug_message(enemy);
		State = State_Enemy_Attack_Start;
	}
	
	Quicktime_Pos += 4;
	
	if(Quicktime_Pos >= 576)
	{
	State = State_Enemy_Attack_Start;
	}
}

State_Fight = function()
{
	var up = keyboard_check_pressed(vk_up);
	var down = keyboard_check_pressed(vk_down);
	var z = (keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter));
	var _x = (keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_shift));
	
	if(down)
	{
		Enemy_select_Index ++
		if(Enemy_select_Index > array_length(Enemy_Count) - 1)
		{
			Enemy_select_Index = 0;
		}
	}
	if(up)
	{
		Enemy_select_Index --;
		if (Enemy_select_Index < 0)
		{
			Enemy_select_Index = array_length(Enemy_Count) - 1;
		}
	}	
	if(z)
	{
	
		State = State_Quicktime;
		Quicktime_Pos = 0;
		/*
		var enemy = Enemy_Count[Enemy_select_Index]; //Get the enemy
		enemy._health -= global.Attack; // we'll switch this out for proper attacks eventually
		if (enemy._health <= 0)
		{
			array_delete(Enemy_Count,Enemy_select_Index,1); // removes enemy if dead
		}
		show_debug_message(enemy);
		State = State_Selec;
		*/
		
	}
	if(_x)
	{
		State = State_Selec;			
	}

}

State_Act_Enemy_Select = function()
{
	var up = keyboard_check_pressed(vk_up);
	var down = keyboard_check_pressed(vk_down);
	var z = (keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter));
	var _x = (keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_shift));
	
	if(down)
	{
		Enemy_select_Index ++
		if(Enemy_select_Index > array_length(Enemy_Count) - 1)
		{
			Enemy_select_Index = 0;
		}
	}
	if(up)
	{
		Enemy_select_Index --;
		if (Enemy_select_Index < 0)
		{
			Enemy_select_Index = array_length(Enemy_Count) - 1;
		}
	}	
	if(z)
	{
		State = State_Act_Select;
	}
	if(_x)
	{
		State = State_Selec;			
	}
}

State_Act_Select = function()
{
	var up = keyboard_check_pressed(vk_up);
	var down = keyboard_check_pressed(vk_down);
	var left = keyboard_check_pressed(vk_left);
	var right = keyboard_check_pressed(vk_right);
	var z = (keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter));
	var _x = (keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_shift));
	
	var enemy = Enemy_Count[Enemy_select_Index];
	
	if(down)
	{
		Act_Index += 2;
	}
	if(up)
	{
		Act_Index -= 2;
	}	
	if(right)
	{
		Act_Index ++;
		if(Act_Index > array_length(enemy.act_actions) - 1)
		{
			Act_Index = 0;
		}
	}
	if(left)
	{
		Act_Index --;
		Act_Index ++;
		if(Act_Index < 0)
		{
			Act_Index = array_length(enemy.act_actions) - 1;
		}
	}
	if(z)
	{
	Act_Value = enemy.act_actions[Act_Index];
	State = State_Act_Consequence;
	if(Act_Value.ID = "Sans_Talk")
{
Dialog = string_hash_to_newline("You talk to Sans.#He understands how array_foreach#works now.");
Current_Char = 0;
enemy.dialog_next = "Ah okay now I understand now";
enemy.spareable = true;
}
	if(Act_Value.ID = "Sans_Argue")
{
Dialog = string_hash_to_newline("You argue with Sans,#yelling at him for 'befriending'#your mother last night.");
Current_Char = 0;
enemy.dialog_next = "Human, I remember I'm you're dad.";
enemy.ATK = 2;
}
if(Act_Value.ID = "Sans_Instakill")
{
	Dialog = string_hash_to_newline("You tell sans he's cringe.#He dies.");
	Current_Char = 0;
	enemy.dialog_next = "Oof i'm ded (this message is not supposed to be here)";
	enemy._health = 0;
}
		//Nothing yet
	}
	if(_x)
	{
		State = State_Act_Enemy_Select;			
	}
	
}

State_Act_Consequence = function()
{
if(Act_Value.ID = "Sans_Talk")
{

}
}

State_Mercy = function()
{
	
	var z = (keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter));
	var _x = (keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_shift));
	var up = keyboard_check_pressed(vk_up)
	var down = keyboard_check_pressed(vk_down)
	if(down)
	{
		Mercy_Index ++
		if(Mercy_Index > array_length(Mercy_Select) - 1)
		{
			Mercy_Index = 0
		}
	}
	if(up)
	{
		Mercy_Index --
		if(Mercy_Index < 0)
		{
			Mercy_Index = array_length(Mercy_Select) - 1
		}
	}
			
	if(_x)
	{
	State = State_Selec;
	}
	
	if(z)
	{
	if(Mercy_Select[Mercy_Index] = "Flee")
	{
	Heart_Pos_Mod = 0;
	State = State_Flee;
	}
	}
		
}

State_Flee = function()
{
Heart_Pos_Mod -= 1;
if(Heart_Pos_Mod + 52 < -16)
{
room_goto(global.Game_Data.Previ_Room);
	obj_mainchara.x = global.Game_Data.PlayerStartxPos;
	obj_mainchara.y = global.Game_Data.PlayerStartyPos;
}
}

State_Enemy_Attack_Start = function()
{
		randomise();
		var enemy = Enemy_Count[0];
		var attack_num = irandom(array_length(enemy.Attacks)-1);
		var battle_box = enemy.Attacks[attack_num].BattleBoxSize;
		new_border(battle_box.Left,battle_box.Right,battle_box.Up,battle_box.Down);
		enemy.Attacks[attack_num].pattern();
		started = true;
		_x = (battle_box.Right + battle_box.Left)/2-8;
		_y = (battle_box.Up + battle_box.Down)/2-8;
		x = _x;
		y = _y;
		global.invincible = 0;
		global.TurnTimer = enemy.Attacks[attack_num].Duration*60
		State = State_Enemy_Attack;

}

State_Enemy_Attack = function()
{
	global.TurnTimer --;
	if (global.TurnTimer <=0)
	{
		obj_bullet_parent.alarm[11] = 1;
		global.invincible = 0;
		State = State_Selec;
		
	}
	if (global.invincible > 0)
	{
		global.invincible --;
		image_speed = 3;
	}
	else
	{
		image_index = 0;
		image_speed = 0;
	}
	var Speed = 2;
	var xDirection = keyboard_check(vk_right) - keyboard_check(vk_left);
	var yDirection = keyboard_check(vk_down) - keyboard_check(vk_up);
	if keyboard_check(vk_shift) or keyboard_check(ord("X"))
	{
		Speed = 1
	}
	
	xSpeed = xDirection * Speed;
	ySpeed = yDirection * Speed;
	
	if(place_meeting(x + xSpeed, y, obj_border_parent))
	{
		xSpeed = 0;
	}

	if(place_meeting(x, y + ySpeed, obj_border_parent))
	{
		ySpeed = 0;
	}
	
	x += xSpeed;
	y += ySpeed;
	show_debug_message(global.Game_Data.Health);
	started = false
}

State = State_Selec