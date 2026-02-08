// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_battle_gen_intro_dialogue(dialogue){
	with (instance_create_layer(0,0,"Instances", obj_battle_text_handler))
	{
		mode = "encounter";
		_message = dialogue;
	}

}