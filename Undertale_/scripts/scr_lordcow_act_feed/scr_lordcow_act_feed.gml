// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_lordcow_act_feed()
{
	if(other.enemy.last_act != "feed")
	{
		_message[0] = "* You try to offer grass to#  Lordcow.";
		_message[1] = "* She seems unintrested.";
		global.battle.flavour_text = "* Lordcow is regretting not#  taking the grass.";
	}
	else
	{
		_message[0] = "* You offer some grass to Lordcow.";
		_message[1] = "* She eagerly eats it out of your#  hand.";
	}
	other.enemy.last_act = "feed";
}