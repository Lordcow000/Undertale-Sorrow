event_inherited();

if (interact && waiter == 0)
{
	waiter = 1;
	scr_gen_dialoguer()
}

if (waiter == 1)
{
	if (talked_to_amt == 6)
	{
		with(msg)
		{
			portrait = false;
			if scr_item_add(ItemID.Hair_Clip)
			{
				dialogue_list[0] = "* Fine, take this."
				dialogue_list_colour[0].text = ""
				dialogue_list[1] = "* (You got the hair clip)"
				dialogue_list_colour[1].text = ""
			}
			else
			{
				dialogue_list[0] = "* Fine, take thi- Oh? You're#  carrying too much?"
				dialogue_list_colour[0].text = ""
				dialogue_list[1] = "* Too bad, i think you would've#  looked pretty."
				dialogue_list_colour[1].text = ""
			}
				
		
			
		}
	}
	
	else if(talked_to_amt >= 5)
	{
		with(msg)
		{
			portrait = false;
			dialogue_list[0] = "* LEAVE ME ALONE!!!"
			dialogue_list_colour[0].text = "* LEAVE ME ALONE!!!"
			dialogue_list_colour[0].colour = c_red
		}
	}
	
	
	else
	{
		with(msg)
		{
			portrait = false;
			dialogue_list[0] = "* You've talked to me:#  " + string(other.talked_to_amt) + " times."
			dialogue_list_colour[0].text = ""
		}
	}
	waiter = 2;
	
}
//other.waiter = 2;

if (waiter == 2 && !instance_exists(obj_dialogue))
{
	waiter = 0;
	talked_to_amt += 1;
	can_interact = true;
	global.choicer_outcome = 0;
}