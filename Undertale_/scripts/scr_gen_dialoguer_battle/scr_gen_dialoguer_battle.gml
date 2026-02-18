// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_gen_dialoguer_battle(){
	
	if(!instance_exists(obj_dialogue_battle))
	{
		msg = instance_create_layer(x,y,"Instances",obj_dialogue_battle);
	}

}