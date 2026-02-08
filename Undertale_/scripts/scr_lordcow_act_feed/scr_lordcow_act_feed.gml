// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_lordcow_act_feed()
{
	if(other.enemy.last_act == "feed")
	{
		_message[0] = "* You try to offer more grass to#  her."
		_message[1] = "* She still seems unintrested."
	}
	else
	{
		_message[0] = "* You offer some grass to Lordcow.";
		_message[1] = "* She seems unintrested.";
	}
	other.enemy.object.y -= 30
	other.enemy.last_act = "feed"
}