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
			dialogue_list[0] = "* Fine, take this."
			dialogue_list[1] = "* (You got a hair clip.)"
			scr_item_add(ItemID.Hair_Clip);
			
		}
	}
	
	else if(talked_to_amt >= 5)
	{
		with(msg)
		{
			portrait = false;
			dialogue_list[0] = "* LEAVE ME ALONE!!!"
		}
	}
	
	
	else
	{
		with(msg)
		{
			portrait = false;
			dialogue_list[0] = "* You've talked to me:#  " + string(other.talked_to_amt) + " times."
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
	outcome = 0;
}