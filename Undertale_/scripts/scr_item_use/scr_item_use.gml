// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_item_use(Item,item_slot,item_id){

	switch(Item.type)
	{
		case "Heal":
			scr_gen_dialoguer();	
			with (msg)
			{
				_health = global.Game_Data.Health;
				_max_health = global.Game_Data.MaxHealth;
				
				msg_length = array_length(Item.use);
		
				for(i = 0; i < msg_length; i++)
				{
					dialogue_list[i] = Item.use[i];
				}
				_health += Item.heal_value;
				
				dialogue_list[msg_length] = "* Healed "+string(Item.heal_value)+" HP!"
				
				if (_health >=_max_health)
				{
					dialogue_list[msg_length] = "* HP maxed out.";
					_health = clamp(_health, 0, _max_health);
				}
				global.Game_Data.Health = _health;
				global.Game_Data.Inventory[item_slot] = "Nothing";
			}
		break
			
		case "Armor":	
			scr_gen_dialoguer();
			with (msg)
			{
				msg_length = array_length(Item.use);
		
				for(i = 0; i < msg_length; i++)
				{
					dialogue_list[i] = Item.use[i];
				}
				
				global.Game_Data.Inventory[item_slot] = global.Game_Data.ArmorEquipped;
				global.Game_Data.ArmorEquipped = item_id;
			}
		break
			
		case "Weapon":
			scr_gen_dialoguer();
			with (msg)
			{
				msg_length = array_length(Item.use);
		
				for(i = 0; i < msg_length; i++)
				{
					dialogue_list[i] = Item.use[i];
				}
				
				global.Game_Data.Inventory[item_slot] = global.Game_Data.WeaponEquipped;
				global.Game_Data.WeaponEquipped = item_id;
			}
		break
		
		default:
			scr_gen_dialoguer();
			with (msg)
			{
				msg_length = array_length(Item.use);
		
				for(i = 0; i < msg_length; i++)
				{
					dialogue_list[i] = Item.use[i];
				}
			}
		break
		
	}
	for (var n = 0; n < 7; n++)
    {
        if (global.Game_Data.Inventory[n] == "Nothing" && global.Game_Data.Inventory[n + 1] != "Nothing")
        {
            global.Game_Data.Inventory[n] = global.Game_Data.Inventory[n + 1];
            global.Game_Data.Inventory[n + 1] = "Nothing";
            n = 0;
        }
    }

}