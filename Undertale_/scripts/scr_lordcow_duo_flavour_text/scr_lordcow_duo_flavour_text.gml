// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_lordcow_duo_flavour_text()
{
	
	for(i =0; i < array_length(global.battle.enemies);i++)
	{
		if(global.battle.enemies[i].hp < 115)
		{
			_message[0] = "* Lordcow looks weak.";
			return;
		}
	}
	switch irandom_range(0,2)
	{
		case 0:
			_message[0] = "* The Lordcows are looking#  at eachother";
			break
		case 1:
			_message[0] = "* One of the cows spins around#* The other stares at you"
			break
		case 2:
			_message[0] = "* A evil and intimidating horse#  stares at the cows"
	}
	
	
}