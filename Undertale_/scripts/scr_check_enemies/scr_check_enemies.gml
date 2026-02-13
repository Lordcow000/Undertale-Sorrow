// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_check_enemies()
{
	enemies = global.battle.enemies;
	
	for(var i = 0; i < array_length(enemies); i++)
	{
		if(!enemies[i].spared && !enemies[i].killed)
		{
			return false;
		}
	}
	return true;

}