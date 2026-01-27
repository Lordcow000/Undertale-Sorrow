/// @description Insert description here
// You can write your code in this editor
scr_gen_dialoguer();
	
	with (msg)
	{
		portrait = false;
		dialogue_list[0] = "* Are you sure you want to#  drop the " + string(other.item.name) +"?"
		ch_msg = 0;
		ch[1] = "Yes";
		ch[2] = "No";
        if (outcome != 0 && text_current == 0)
        {
			if (outcome == 1)
	        {
				global.Game_Data.Inventory[other.item_slot] = "Nothing"
				show_debug_message("Thrown")
	            for (var n = 0; n < 7; n++)
			    {
			        if (global.Game_Data.Inventory[n] == "Nothing" && global.Game_Data.Inventory[n + 1] != "Nothing")
			        {
			            global.Game_Data.Inventory[n] = global.Game_Data.Inventory[n + 1];
			            global.Game_Data.Inventory[n + 1] = "Nothing";
			            n = 0;
			        }
			    }
				instance_destroy(other);
			
	        }
		}
		
	}