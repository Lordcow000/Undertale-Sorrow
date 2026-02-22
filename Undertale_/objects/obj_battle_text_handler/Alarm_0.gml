/// @description Insert description here
// You can write your code in this editor

if (!instance_exists(obj_dialogue_battle_box))
{
	dialoguer = instance_create_layer(0,y,"Instances",obj_dialogue_battle_box);
}
with dialoguer
{
	switch other.mode
	{
		case "flavour":
			script_execute(global.battle.flavour_text_script);
			break;
		case "encounter":
			_message[0] = global.battle.encounter_text
	}
}