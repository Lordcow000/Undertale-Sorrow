// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_gen_lordcow_solo(){
	global.battle.enemy_amts = 1;
	global.battle.encounter_name = "Lordcow solo";

	global.battle.enemies = [];
	
	global.battle.enemies[0] =
	{
		name: "Lordcow",
		hp: 115,
		max_hp: 115,
		defense: 1,
		actions: 
		[
		{name:"Check",ID: lordcow_act_3},
		{name:"Feed",ID: scr_lordcow_act_feed},
		{name:"Flirt",ID: lordcow_act_2},
		],
		last_act: "",
		object: ""
	};
	global.battle.enemies[0].object = instance_create_layer(80, 80, "Instances", obj_LORDCOW);
}