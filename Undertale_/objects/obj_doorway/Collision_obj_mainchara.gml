/// @description Insert description here
// You can write your code in this editor
//obj_mainchara.State = obj_mainchara.State_Frozen

trans = instance_create_layer(x,y,"Instances",obj_transition);
trans.new_room = new_room;
trans.xx = xx;
trans.yy = yy;
trans.dir = dir;
