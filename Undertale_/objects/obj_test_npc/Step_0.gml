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
		dialogue_list[0] = "* WOAW/2 IT, worked#  Line 2#  Line 3";
		dialogue_list[1] = "* WOO HOO 2nd prompt"
	}
	waiter = 2;
	show_debug_message("set dialogue");
}

if (waiter == 2 && !instance_exists(obj_dialogue))
{
	waiter = 0;
	can_interact = true;
}