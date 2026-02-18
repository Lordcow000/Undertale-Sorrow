// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_battle_act_use(act,enemy){
	scr_gen_dialoguer_battle();	
	with (msg)
	{
		script_execute(act.ID)
	}
}
				