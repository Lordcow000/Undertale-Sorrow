// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_lordcow_act_flirt(){
	_message[0] = "* You try to flirt with Lordcow.";
	_message[1] = "* She can't undestand you.#* she's a cow afterall";
	_message[2] = "* Regardless, she's flattered#  anyway.";
	other.enemy.spareable = true;
	
}