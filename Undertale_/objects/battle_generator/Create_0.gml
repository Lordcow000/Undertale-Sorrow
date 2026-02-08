/// @description Insert description here
// You can write your code in this editor
global.battle = new battle_struct();
scr_gen_lordcow_duo(); //Eventuallly switch with something that calls other encounter funcs
scr_border_gen();
instance_create_layer(0,0,"Instances",obj_heart_1);