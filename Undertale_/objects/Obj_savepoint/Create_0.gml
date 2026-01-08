Save_Select = 0
Save_Index = ["Save", "Return"]
Saved = false

State_Dialogue = function()
{
if(place_meeting(x, y, obj_interactcollision))
{
if (obj_mainchara.State != obj_mainchara.State_Talking){

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
}
State_Save = function()
{
	var z = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("Z"))
	var left = keyboard_check_pressed(vk_left)
	var right = keyboard_check_pressed(vk_right)
	if(left)
	{
		Save_Select++
		if Save_Select > array_length(Save_Index) - 1
		{
			Save_Select = 0
		}
	}
	if(right)
	{
		Save_Select--
		if Save_Select < 0
		{
			Save_Select = array_length(Save_Index) - 1
		}
	}
	if(z)
	{
		switch(Save_Select)
		{
			case 0:
			save_game()
			Saved = true
			case 1:
			State = State_Dialogue()
		}
	}
	if Saved = true
	{
		if(z)
		{
			State = State_Dialogue()
			Saved = false
		}
	}
}
State = State_Dialogue