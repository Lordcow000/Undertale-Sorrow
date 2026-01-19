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
		show_debug_message("Interacted");
	}

}