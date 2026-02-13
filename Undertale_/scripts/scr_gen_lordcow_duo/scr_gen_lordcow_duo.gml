// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_gen_lordcow_duo(){
	global.battle.enemy_amts = 2;
	global.battle.encounter_name = "Lordcow duo";
	global.battle.encounter_text = "* Lordcow appeard!#* Lordcow came too."

	global.battle.enemies = [];
	
	global.battle.enemies[0] =
	{
		name: "Lordcow a",
		hp: 1,
		max_hp: 115,
		defense: 1,
		gold: 1000,
		xp: 100,
		actions: 
		[
		{name:"Check",ID: lordcow_act_3},
		{name:"Feed",ID: scr_lordcow_act_feed},
		{name:"Flirt",ID: scr_lordcow_act_flirt},
		],
		last_act: "",
		spareable: false,
		spared: false,
		killed: false,
		object: ""
	};
	global.battle.enemies[0].object = instance_create_layer(80, 80, "Instances", obj_LORDCOW);
	
	global.battle.enemies[1] =
	{
		name: "Lordcow b",
		hp: 1,
		max_hp: 115,
		defense: 1,
		gold: 1000,
		xp: 100,
		actions: 
		[
		{name:"Check",ID: lordcow_act_3},
		{name:"Feed",ID: scr_lordcow_act_feed},
		{name:"Flirt",ID: scr_lordcow_act_flirt},
		],
		last_act: "",
		spareable: false,
		spared: false,
		killed: false,
		object: ""
	};
	global.battle.enemies[1].object = instance_create_layer(380, 80, "Instances", obj_LORDCOW);

}