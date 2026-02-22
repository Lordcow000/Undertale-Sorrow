/// @description Insert description here
// You can write your code in this editor
global.battle = new battle_struct();
show_debug_message(global.encounter_script)
script_execute(global.encounter_script);
scr_border_gen();
instance_create_layer(0,0,"Instances",obj_heart_new);