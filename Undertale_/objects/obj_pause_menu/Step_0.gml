/// @description Insert description here
// You can write your code in this editor
if (!Inventory_open && !Stats_open && !Cell_open)
{
	var Down = keyboard_check_pressed(vk_down);
	var Up = keyboard_check_pressed(vk_up);
	
	if(scr_multicheck_pressed(1) || scr_multicheck_pressed(2))
	{
		instance_destroy();
	}
	
	if(scr_multicheck_pressed(0))
	{
		switch(MenuSelect[Menu_Index]) 
		{
			case "ITEM":
				if(array_length(global.Game_Data.Inventory) != 0)
				{
					Inventory_open = true;
					good_to_go = false;
					
				}
				break;
			
			case "STATS":
				Stats_open = true;
				break;
		}
	}
 	if(Down)
	{
		Menu_Index ++
		if(Menu_Index > array_length(MenuSelect) - 1)
		{
			Menu_Index = 0;
		}
		audio_play_sound(snd_main_select,1,false);
	}
	if(Up)
	{
		Menu_Index --
		if(Menu_Index < 0)
		{
			Menu_Index = array_length(MenuSelect) - 1
		}
		audio_play_sound(snd_main_select,1,false);
	}
}

if (Inventory_open && !Item_inspect)
{
	show_debug_message("Inventory open")
	var Down = keyboard_check_pressed(vk_down);
	var Up = keyboard_check_pressed(vk_up);
	var _inventory = global.Game_Data.Inventory;
	
	var item_number = 8;
    
    for (var i = 0; i <= 7; i++)
    {
        if (_inventory[i] == "Nothing")
        {
            item_number = i - 1;
            break;
        }
    }

	if(Down)
	{
		Inventory_Index ++;
		if(Inventory_Index > item_number)
		{
			Inventory_Index = 0;
		}
		audio_play_sound(snd_main_select,1,0);
	}
	if(Up)
	{
		Inventory_Index --;
		if(Inventory_Index < 0)
		{
			Inventory_Index = item_number;
		}
		audio_play_sound(snd_main_select,1,0);
	}

	if(scr_multicheck_pressed(0) && good_to_go)
	{
		Current_Item = _inventory[Inventory_Index];
		Item_inspect = true;
	}
	
	if(scr_multicheck_pressed(2))
	{
		instance_destroy();
	}
	
	if(scr_multicheck_pressed(1))
	{
		Inventory_open = false;
	}
	
	good_to_go = true;
}

if (Item_inspect)
{
	var Left = keyboard_check_pressed(vk_left);
	var Right = keyboard_check_pressed(vk_right);
	
	if(Right)
	{
		Inspect_index ++
		if(Inspect_index > 2)
		{
			Inspect_index = 0;
		}
		audio_play_sound(snd_main_select,1,false);
	}
	if(Left)
	{
		Inspect_index --
		if(Inspect_index < 0)
		{
			Inspect_index = 2;
		}
		audio_play_sound(snd_main_select,1,false);
	}
	
	if(scr_multicheck_pressed(1))
	{
		Item_inspect = false;
		Inspect_index = 0;
	}	
}

if (Stats_open)
{
	if(scr_multicheck_pressed(1))
	{
		Stats_open = false;
	}
}
