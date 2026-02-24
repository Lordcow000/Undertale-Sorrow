/// @description Insert description here
// You can write your code in this editor
if (is_blue)
{
	if (other.xSpeed != 0 || other.ySpeed != 0)
	{
		if (global.invincible <= 0)
		{
			var act_dmg = round(dmg - (scr_get_player_def()/5));
			if (act_dmg <= 0)
			{
				act_dmg = 1;
			}
			global.Game_Data.Health -= act_dmg;
	
			global.invincible = 60;
			if(delete_on_touch)
				instance_destroy();
		}
	}
}

else if (is_orange)
{
	if (other.xSpeed == 0 && other.ySpeed == 0)
	{
		if (global.invincible <= 0)
		{
			var act_dmg = round(dmg - (scr_get_player_def()/5));
			if (act_dmg <= 0)
			{
				act_dmg = 1;
			}
			global.Game_Data.Health -= act_dmg;
	
			global.invincible = 60;

			if(delete_on_touch)
				instance_destroy();
		}
	}
}
else
{
	if (global.invincible <= 0)
	{
		var act_dmg = round(dmg - (scr_get_player_def()/5));
		if (act_dmg <= 0)
		{
			act_dmg = 1;
		}
		global.Game_Data.Health -= act_dmg;
	
		global.invincible = 60;

		if(delete_on_touch)
				instance_destroy();
	}
}
show_debug_message("Player Health: " + string(global.Game_Data.Health));