/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (interact && waiter == 0)
{
	waiter = 1;
	scr_gen_dialoguer();
	show_debug_message("created dialoguer");
}

if (waiter == 1)
{
	with (msg)
	{
		portrait = true;
		dialogue_list[0] = "* WOAW/2 IT, worked#  Line 2#  Line 3";
		dialogue_list[1] = "* WOO HOO 2nd prompt";
		dialogue_list[2] = "More portrait test";
		dialogue_list[3] = "More portrait test";
		dialogue_list[4] = "More portrait test"
		
		prt[0] = Ralsei_port_blush;
		prt[1] = false;
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