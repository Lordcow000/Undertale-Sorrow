/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x, y, obj_interactcollision))
{
if (obj_mainchara.State != obj_mainchara.State_Talking){

obj_mainchara.State = obj_mainchara.State_Talking;
var _dialog = instance_create_layer(x, y, "Instances", obj_dia_test_new);

with(_dialog)
{
dialogue_list = other.dialogue_list;
dialogue_list[0].Text = string_wrap(dialogue_list[0].Text, text_width);

if (variable_struct_exists(dialogue_list[text_current],"Portrait")) 
	{
		var Dialouge_port = dialogue_list[text_current].Portrait;
		Portrait = true;
		dialogue_list[text_current].Text = string_wrap(dialogue_list[text_current].Text, text_width - (sprite_get_width(Dialouge_port) + 15));

	}
}
}
}