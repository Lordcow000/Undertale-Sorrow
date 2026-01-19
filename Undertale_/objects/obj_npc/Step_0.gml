/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x, y, obj_interactcollision))
{
if (obj_mainchara.State != obj_mainchara.State_Talking)
{
obj_mainchara.State = obj_mainchara.State_Talking;

var _dialog = instance_create_layer(x, y, "Instances", obj_dia_test_new);

with(_dialog)
{
Dialog_List = other.Dialog_List;
Dialog_List[0].Text = string_wrap(Dialog_List[0].Text, text_width);

if (variable_struct_exists(Dialog_List[text_current],"Portrait")) 
	{
		var Dialouge_port = Dialog_List[text_current].Portrait;
		Portrait = true;
		Dialog_List[text_current].Text = string_wrap(Dialog_List[text_current].Text, text_width - (sprite_get_width(Dialouge_port) + 15));

	}
}

}
}