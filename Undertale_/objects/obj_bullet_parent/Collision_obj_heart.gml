/// @description Insert description here
// You can write your code in this editor
if (is_blue)
{
	if (other.xSpeed != 0 || other.ySpeed != 0)
	{
		if (global.invincible <= 0)
		{
			var act_dmg = round(dmg - (global.Game_Data.Defense/5));
			global.Game_Data.Health -= act_dmg;
	
			global.invincible = 60;

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
			var act_dmg = round(dmg - (global.Game_Data.Defense/5));
			global.Game_Data.Health -= act_dmg;
	
			global.invincible = 60;

			instance_destroy();
		}
	}
}
else
{
	if (global.invincible <= 0)
	{
		var act_dmg = round(dmg - (global.Game_Data.Defense/5));
		global.Game_Data.Health -= act_dmg;
	
		global.invincible = 60;

		instance_destroy();
	}
}