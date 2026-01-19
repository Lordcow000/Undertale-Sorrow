/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (interact && waiter == 0)
{
	waiter = 1;
	dialoger = instance_create_layer(x, y, "Instances", obj_dialogue);
	show_debug_message("created dialoguer");
}

if (waiter == 1)
{
	with (dialoger)
	{
		portrait = false;
		dialogue_list[0] = "* I'm Wing Gaster.";
		ch_msg = 0;
		ch[1] = "Hi";
		ch[2] = "HOI";
		
		if (outcome != 0 && text_current == 0)
        {
            if (outcome == 1)
            {
                dialogue_list[1] = "* You said Hi";
            }
            else if (outcome == 2)
            {
                dialogue_list[1] = "* HOI!!!";
            }

            
            // Now advance to waiter 2
            other.waiter = 2;
        }
	}
}

if (waiter == 2 && !instance_exists(obj_dialogue))
{
	waiter = 0;
	can_interact = true;
	outcome = 0;
}