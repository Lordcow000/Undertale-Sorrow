/// @description Insert description here
// You can write your code in this editor

if (global.invincible <= 0)
{
	var act_dmg = round(dmg - (global.Defense/5));
	global.Health -= act_dmg;
	
	global.invincible = 60;

	instance_destroy();
}