items = global.Game_Data.Inventory;

layer_id = layer_get_id("Background"); 
bg_id = layer_background_get_id(layer_id);
layer_background_blend(bg_id,global.battle.bg_colour);

act_cols = 2;
item_cols = 2;

Selec_Index = 0;
mercy_index = 0;
act_index = 0;
item_index = 0;
enemy_select_index = 0;
mode = "act";

Selec = ["FIGHT", "ACT", "ITEM", "MERCY"]
mercy_select = ["Spare", "Flee"];

first_turn = true;

Quicktime_Pos = 0;

pages_on = false
inv_page1 = [];
inv_page2 = [];
page_1_len = 0;
page_2_len = 0;
current_page = "left";
current_page_list = inv_page1;


started = false;
image_speed = 0;
battle_bar_index = 0;

global.instantborder = true;
global.idealborder[0] = 32;
global.idealborder[1] = 602;
global.idealborder[2] = 250;
global.idealborder[3] = 385;

enemies = global.battle.enemies;
global.battle.draw_text = true;

up = keyboard_check_pressed(vk_up);
down = keyboard_check_pressed(vk_down);
left = keyboard_check_pressed(vk_left);
right = keyboard_check_pressed(vk_right);
select = scr_multicheck_pressed(0);
cancel = scr_multicheck_pressed(1);

global.battle.turn_timer = 120;

gained_gold = 0;
gained_exp = 0;

State_Temp_battle_start = function()
{

	_x = (237 + 397)/2-8; //Replace with left and right
	_y = (250 + 385)/2-8; // replace with up and down
	x = _x;
	y = _y;
	global.invincible = 0;
	global.battle.turn_timer = 120;
	State = State_Temp_battle;
	
}

State_Temp_battle = function ()
{
	global.instantborder = false;
	scr_new_border(237, 397, 250, 385);
	
	global.battle.turn_timer --;
	if (global.battle.turn_timer <=0)
	{
		State = State_New_Turn;
	}
}

State_New_Turn = function()
{
	if(instance_exists(obj_battle_text_handler))
	{
		instance_destroy(obj_battle_text_handler);
	}
	
	if(instance_exists(obj_battle_act_text_handler))
	{
		instance_destroy(obj_battle_act_text_handler);
	}
	first_turn = false;

	mercy_index = 0;
	act_index = 0;
	enemy_select_index = 0;
	
	
	
	global.instantborder = false;
	scr_new_border(32, 602, 250, 385);
	
	if (!scr_check_borders())
    {
        return; // stay in this state until finished HOWEVER, IT DOESNT FUCKING WORK
    }
	

	if(scr_check_enemies())
	{
		State = State_End_Battle_Stats;
	}
	
	else
	{
		State = State_Selec;
	}
	
	
	
	
	
}

State_Selec = function()
{

	if (!instance_exists(obj_battle_text_handler))
	{
		if (!first_turn)
		{
			instance_create_layer(0,0,"Instances",obj_battle_text_handler);
		}
		else
		{
			i = instance_create_layer(0,0,"Instances",obj_battle_text_handler);
			i.mode = "encounter"
		}
	}

	

	
	global.battle.draw_text = true;
	
	if(right)
	{
		audio_play_sound(snd_main_select,1,false);
		Selec_Index ++;
		if(Selec_Index > array_length(Selec) - 1)
		{
			Selec_Index = 0
		}
	}
	if(left)
	{
		audio_play_sound(snd_main_select,1,false);
		Selec_Index --;
		if(Selec_Index < 0)
		{
			Selec_Index = array_length(Selec) - 1;
		}
	}
	if(select)
	{
		global.battle.draw_text = false;

		switch(Selec_Index)
		{
			case 0:
			mode = "attack";
			State = State_Enemy_Select;
			break
			
			case 1:
			mode = "act";
			State = State_Enemy_Select;
			break
			
			case 2:
			State = State_Items;
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
	var center_x = 319;
	_accuracy_multi=1;
	battle_bar_index += .1;
	enemies = global.battle.enemies;
	
	if(select)
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
		
		var enemy = enemies[enemy_select_index];
		
		var _damage = ceil(round( (Fetch_item(global.Game_Data.WeaponEquipped).atk + global.Game_Data.Attack) - enemy.defense + random(2)) * _accuracy_multi)
		
		show_debug_message(_damage);
		
		enemy.hp -= _damage;
		
		if(enemy.hp <= 0 )
		{
			enemy.killed = true;
			instance_destroy(enemy.object);
		}
		Quicktime_Pos = 0;
		
		if(scr_check_enemies())
		{
			
			State = State_End_Battle_Stats;
		}
		
		else
		{
			State = State_Temp_battle;
		}
		
	}
	
	Quicktime_Pos += 4;
	
	if(Quicktime_Pos >= 576)
	{
		State = State_Temp_battle;
	}
}

State_Enemy_Select = function()
{
	enemies = global.battle.enemies;
	
	if (enemies[enemy_select_index].spared || enemies[enemy_select_index].killed)
	{
	    repeat (array_length(enemies))
	    {
	        enemy_select_index++;
        
	        if (enemy_select_index > array_length(enemies) - 1)
	        {
	            enemy_select_index = 0;
	        }

	        if (!enemies[enemy_select_index].spared || enemies[enemy_select_index].killed)
	        {
	            break;
	        }
	    }
	}
	
	
	if (down)
	{
	    repeat (array_length(enemies))
	    {
			audio_play_sound(snd_main_select,1,false);
	        enemy_select_index++;
        
	        if (enemy_select_index > array_length(enemies) - 1)
	        {
	            enemy_select_index = 0;
	        }

	        if (!enemies[enemy_select_index].spared || enemies[enemy_select_index].killed)
	        {
	            break;
	        }
	    }
	}

	if (up)
	{
	    repeat (array_length(enemies))
	    {
			audio_play_sound(snd_main_select,1,false);
	        enemy_select_index--;
        
	        if (enemy_select_index < 0)
	        {
	            enemy_select_index = array_length(enemies) - 1;
	        }

	        if (!enemies[enemy_select_index].spared || enemies[enemy_select_index].killed)
	        {
	            break;
	        }
	    }
	}

	if(select)
	{
		if(mode = "act")
		{
			State = State_Act_Select;
		}
		else if(mode = "attack")
		{
			State = State_Quicktime;
		}
		
	}
	if(cancel)
	{
		State = State_Selec;			
	}
}

State_Act_Select = function()
{

	enemies = global.battle.enemies;

	var enemy = enemies[enemy_select_index];

	var total = array_length(enemy.actions);


	var rows = ceil(total / act_cols);

	var col = act_index mod act_cols;
	var row = act_index div act_cols;
	
	
	var new_col = col;
	var new_row = row;

	if (down)
	{
	    new_row = row + 1;
	    if (new_row * act_cols + col >= total)
	    {
	        new_row = 0;
	    }
		audio_play_sound(snd_main_select,1,false);
	}

	if (up)
	{
	    new_row = row - 1;
		if (new_row < 0) 
		{
			new_row = rows - 1;
		}
		
		while (new_row * act_cols + col >= total)
	    {
	        new_row--;
	    }
		
		audio_play_sound(snd_main_select,1,false);

	}
	
	if(right)
	{
		new_col = (col + 1) mod act_cols;

		audio_play_sound(snd_main_select,1,false);
	}
	
	if(left)
	{
		new_col = (col - 1 + act_cols) mod act_cols;

		audio_play_sound(snd_main_select,1,false);
	}
	
	var new_index = new_row * act_cols + new_col;

	if (new_index < total)
	{
	    act_index = new_index;
	}
	
	
	
	if(select)
	{
		_act = enemy.actions[act_index];
		State = State_Act_Start;
	}
	if(cancel)
	{
		State = State_Enemy_Select;			
	}
	
}

State_Act_Start = function()
{
	enemy = enemies[enemy_select_index];
	scr_battle_act_use(_act, enemy);
	State = State_Act;
}

State_Items = function()
{
	pages_on = false;
	var inventory = global.Game_Data.Inventory;
	var inv_len = 0;
	
	inv_page1 = ["Nothing","Nothing","Nothing","Nothing"];
	inv_page2 = ["Nothing","Nothing","Nothing","Nothing"];

	
	for(i=0; i<array_length(inventory);i++)
	{
		if(inventory[i]!="Nothing")
		{
			inv_len += 1;
		}
	}
	
	if(inv_len > 4)
	{
		page_2_len = array_length(inventory) - 4;
		pages_on = true;
		
		for(i=0; i < 4;i++)
		{
			inv_page1[i] = inventory[i];
		}
 		for(i=0; i < page_2_len;i ++)
		{
			inv_page2[i] = inventory[i+4]
		}
	}
	else
	{
		pages_on = false;
		inv_page1 = inventory;
	}
	show_debug_message(inv_page1);
	show_debug_message(inv_page2);

	var total = array_length(inventory);
	var page_1_len = array_length(inv_page1)

	show_debug_message(item_index)
	show_debug_message(current_page)
	var rows = ceil(total / item_cols);

	var col = item_index mod item_cols;
	var row = item_index div item_cols;
	show_debug_message(col)

	
	var new_col = col;
	var new_row = row;
	if(current_page == "left")
	{
		current_page_list = inv_page1;
	}
	else
	{
		current_page_list = inv_page2;
	}
	

	if (down)
	{
	    new_row = row + 1;
	    var target = new_row * item_cols + col;

	    if (target >= array_length(current_page_list) || current_page_list[target] == "Nothing")
	    {
	        new_row = 0;
	    }
		audio_play_sound(snd_main_select,1,false);
	}

	if (up)
	{
	    new_row = row - 1;
		
		if (new_row < 0) 
		{
			new_row = rows - 1;
		}
		
		while (new_row >= 0 && (new_row * item_cols + col >= array_length(current_page_list) || current_page_list[new_row * item_cols + col] == "Nothing"))
		{
		    new_row--;
		}

		
		audio_play_sound(snd_main_select,1,false);

	}
	
	if(right)
	{
		if(pages_on && col == 1)
		{
			if(current_page == "left")
			{
				current_page = "right";
			}
			
			else if(current_page == "right")
			{
				current_page = "left";
			}
			
			new_col = 0;
			new_row = 0;
		}
		else
		{
			new_col = (col + 1) mod item_cols
		
			var target = row * item_cols + new_col;
		
			if (target >= array_length(current_page_list) || current_page_list[target] == "Nothing")
		    {
		        new_col = 0;
		    }
		}

		audio_play_sound(snd_main_select,1,false);
	}
	
	if(left)
	{
		if(pages_on && col == 0)
		{
			if(current_page == "left")
			{
				current_page = "right";
				var temp_index = row * item_cols + 1;
				
				if(inv_page2[temp_index] == "Nothing")
					new_col = 0;

				else
					new_col = 1;
					
				var temp_index = 1 * item_cols + new_col;
				if(inv_page2[temp_index] == "Nothing")
					new_row = 0;
					
			}
			
			else if(current_page == "right")
			{
				current_page = "left";
				new_col = 1;
			}
		}
		else
		{
			new_col = (col - 1 + item_cols) mod item_cols;
		
			var target = row * item_cols + new_col;
		
			if (target < 0 || current_page_list[target] == "Nothing")
		    {
		        new_col = 0;
		    }
		}

		audio_play_sound(snd_main_select,1,false);
	}
	
	var new_index = new_row * item_cols + new_col;

	if (new_index < array_length(current_page_list))
	{
	    item_index = new_index;
	}


	if(select)
	{
		var item_slot;

	    if(current_page == "left")
	        item_slot = item_index;
	    else
	        item_slot = item_index + 4;	
			
		var item = Fetch_item(inventory[item_slot]);
		scr_item_use_battle(item, item_slot, inventory[item_slot]);
		current_page = "left";
		item_index = 0;
		
		State = State_Item_Use;
	}
	if(cancel)
	{
		State = State_Selec;			
	}
}

State_Item_Use = function()
{
	if(!instance_exists(obj_dialogue_battle))
	{
		State = State_New_Turn;
	}
}

State_Act = function()
{
	if(!instance_exists(obj_dialogue_battle))
	{
		State = State_New_Turn;
	}
}

State_Mercy = function()
{
	if(down)
	{
		mercy_index ++
		if(mercy_index > array_length(mercy_select) - 1)
		{
			mercy_index = 0
		}
	}
	if(up)
	{
		mercy_index --
		if(mercy_index < 0)
		{
			mercy_index = array_length(mercy_select) - 1
		}
	}
	
	if(cancel)
	{
		State = State_Selec;
	}
	
	if(select)
	{
		if(mercy_select[mercy_index] == "Flee")
		{
			Heart_Pos_Mod = 0;
			State = State_Flee;
		}
		else if(mercy_select[mercy_index] == "Spare")
		{
			array_foreach(enemies,function(enemy,index)
			{
				if(enemy.spareable)
				{
					enemy.spared = true;
					enemy.object.image_blend = c_gray;	
				}
				
			})
			
			if (scr_check_enemies())
			{
				State = State_End_Battle_Stats;
			}
			
			else
			{
				State = State_Temp_battle_start;
			}
		}
	}
		
}

State_Flee = function()
{
	Heart_Pos_Mod -= 1;
	sprite_index = spr_heart_walk
	image_speed = 1
	x = Heart_Pos_Mod + 52;
	y = 275+(mercy_index * 30);

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
		scr_new_border(battle_box.Left,battle_box.Right,battle_box.Up,battle_box.Down);
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

State_End_Battle_Stats = function()
{
	for(i=0; i<array_length(enemies);i++)
	{
		gained_gold += enemies[i].gold
		global.Game_Data.Gold += enemies[i].gold;
		if(enemies[i].killed)
		{
			gained_exp += enemies[i].xp
			global.Game_Data.EXP += enemies[i].xp;
		}
	}
	
	dialoguer = instance_create_layer(0,0,"Instances",obj_dialogue_battle_end);
	dialoguer._message[0] = "* YOU WON!#* You earned " +string(gained_exp)+ " EXP and "+string(gained_gold)+ " Gold.";

	State = State_End_Battle_Gotoroom;
}

State_End_Battle_Gotoroom = function()
{
	if(!instance_exists(obj_dialogue_battle_end))
	{
		room_goto(global.Game_Data.Previ_Room);
		obj_mainchara.x = global.Game_Data.PlayerStartxPos;
		obj_mainchara.y = global.Game_Data.PlayerStartyPos;
	}
}

State = State_Selec;