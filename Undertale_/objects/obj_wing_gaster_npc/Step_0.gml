/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (interact && waiter == 0)
{
	waiter = 1;
	scr_gen_dialoguer();
}

if (waiter == 1)
{
	with (msg)
	{
		portrait = true;
		dialogue_list[0] = "* I'm Wing Gaster.";
		dialogue_list_colour[0].text = "      Wing Gaster "
		ch_msg = 0;
		ch[1] = "Opt 1";
		ch[2] = "Opt 2";
		ch[3] = "Opt 3";
		ch[4] = "Opt 4";
		
		prt[0] = Ralsei_port_royalscientist;
		prt[1] = Ralsei_port_royalscientist;
		
		if (global.choicer_outcome != 0 && text_current == 0)
        {
            if (global.choicer_outcome == 1)
            {
                dialogue_list[1] = "* You selected option 1";
				dialogue_list_colour[1].text = ""
            }
            else if (global.choicer_outcome == 2)
            {
                dialogue_list[1] = "* You selected option 2";
				dialogue_list_colour[1].text = ""
            }
			else if (global.choicer_outcome == 3)
            {
                dialogue_list[1] = "* You selected option 3";
				dialogue_list_colour[1].text = ""
            }
			else if (global.choicer_outcome == 4)
            {
                dialogue_list[1] = "* You selected option 4";
				dialogue_list_colour[1].text = ""
            }

            other.waiter = 2;
        }
	}
}

if (waiter == 2 && !instance_exists(obj_dialogue))
{
	waiter = 0;
	can_interact = true;
	global.choicer_outcome = 0;
}