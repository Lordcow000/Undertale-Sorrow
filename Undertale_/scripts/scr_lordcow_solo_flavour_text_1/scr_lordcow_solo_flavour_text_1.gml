// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_lordcow_solo_flavour_text()
{
	
	for(i =0; i < array_length(global.battle.enemies);i++)
	{
		if(global.battle.enemies[i].hp < 115)
		{
			_message[0] = "* Lordcow looks weak.";
			return;
		}
	}
	switch irandom_range(0,1)
	{
		case 0:
			_message[0] = "* Lordcow stares.";
			break
		case 1:
			_message[0] = "* She's just standing there.../3##  menacingly.";
			break
	}
	
	
}