// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_player_def(){
	return global.Game_Data.Defense + Fetch_item(global.Game_Data.ArmorEquipped).def
}