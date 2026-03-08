// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_lordcow_duo_flavour_text()
{
	
	for(i =0; i < array_length(global.battle.enemies);i++)
	{
		if(global.battle.enemies[i].hp < 30 && !global.battle.enemies[i].killed)
		{
			return "* Lordcow looks weak.";

		}
	}
	
	for(i=0; i < array_length(global.battle.enemies);i++)
	{
		if(global.battle.enemies[i].spared)
		{
			return scr_lordcow_solo_flavour_text();//if one of them is spared, get a random solo Lordcow flavour
		}
		else if(global.battle.enemies[i].killed)
		{
			return "* Lordcow mourns the loss#  of her \"roommate\" "
		}
	}
	switch irandom_range(0,2)
	{
		case 0:
			return "* The Lordcows are looking at#  eachother.";

		case 1:
			return "* One of the cows spins around.#* The other stares at you."

		case 2:
			return "* An evil and intimidating horse#  stares at the cows."
	}
	
	
}