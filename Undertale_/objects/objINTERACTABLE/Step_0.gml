/// @description Insert description here
// You can write your code in this editor
interact = false;

if(place_meeting(x, y, obj_interactcollision))
{
	if (obj_mainchara.State != obj_mainchara.State_Talking)
	{
		obj_mainchara.State = obj_mainchara.State_Talking;
		interact = true;
		can_interact = false;
	}
}



if (interact && waiter == 0)
{
	waiter = 1;
	scr_gen_dialoguer()
}

if (waiter == 1)
{
	with(msg)
	{
		portrait = false;
		
		for(i = 0; i <= array_length(other.Text)-1;i++)
		{
			dialogue_list[i] = other.Text[i];
			show_debug_message(i)
		}
	}

	waiter = 2;
	
}

if (waiter == 2 && !instance_exists(obj_dialogue))
{
	waiter = 0;
	can_interact = true;
}