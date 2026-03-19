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
		dialogue_list[0] = "* I'm Sans, Sans the skeleton";
		dialogue_list_colour[0].text = ""
		dialogue_list_colour[0].colour = c_yellow
		dialogue_list[1] = "* WOO HOO 2nd prompt";
		dialogue_list_colour[1].text = ""
		dialogue_list_colour[1].colour = c_yellow
		dialogue_list[2] = "More portrait test";
		dialogue_list_colour[2].text = ""
		dialogue_list_colour[2].colour = c_yellow
		dialogue_list[3] = "More portrait test";
		dialogue_list_colour[3].text = ""
		dialogue_list_colour[3].colour = c_yellow
		dialogue_list[4] = "More portrait test"
		dialogue_list_colour[4].text = ""
		dialogue_list_colour[4].colour = c_yellow
		
		prt[2] = Ralsei_port_happy;
		prt[3] = Ralsei_port_normal;
		prt[4] = Ralsei_port_royalscientist;
	}
	waiter = 2;
	show_debug_message("set dialogue");
}

if (waiter == 2 && !instance_exists(obj_dialogue))
{
	waiter = 0;
	can_interact = true;
}