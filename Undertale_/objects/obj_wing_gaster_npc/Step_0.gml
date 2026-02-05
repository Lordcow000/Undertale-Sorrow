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
		ch_msg = 0;
		ch[1] = "Hi";
		ch[2] = "HOI";
		
		prt[0] = Ralsei_port_royalscientist;
		prt[1] = Ralsei_port_royalscientist;
		
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