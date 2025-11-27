/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x, y, obj_interactcollision))
{
obj_mainchara.State = obj_mainchara.State_Talking;
var _dialog = instance_create_layer(x, y, "Instances", obj_dia_test);
with(_dialog)
{
Dialog_List = other.Dialog_List;
}
}