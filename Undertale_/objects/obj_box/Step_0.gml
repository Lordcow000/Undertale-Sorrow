/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x, y, obj_interactcollision))
{
	if (obj_mainchara.State == obj_mainchara.State_Overworld)
	{
		obj_mainchara.State = obj_mainchara.State_Frozen;
		open = true;

	}
}

if(open)
{
	
}