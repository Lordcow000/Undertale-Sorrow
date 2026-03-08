// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_gen_lordcow_solo(){
	global.battle.enemy_amts = 2;
	global.battle.encounter_name = "Lordcow solo";
	global.battle.encounter_text = "* Lordcow appeard!"
	global.battle.flavour_text = "* Lordcow appeard!"
	
	global.battle.flavour_text_script = scr_lordcow_solo_flavour_text;
	global.battle.enemy_attack_scr = scr_lordcow_solo_attacks;
	global.battle.bubble_generator = scr_gen_bubble_lordcow_solo;
	
	global.battle.bg_colour = c_green;
	global.battle_mus = mus_battle;

	global.battle.enemies = [];
	
	global.battle.enemies[0] =
	{
		name: "Lordcow",
		hp: 115,
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
		current_dialogue: "",
		spareable: false,
		spared: false,
		killed: false,
		object: ""
	};
	global.battle.enemies[0].object = instance_create_layer(240, 80, "Instances", obj_LORDCOW,{ depth: 10});
}