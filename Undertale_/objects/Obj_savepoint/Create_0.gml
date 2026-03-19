event_inherited()
Save_Select = 0
Save_Index = ["Save", "Return"]
Saved = false

State_Dialogue = function()
{
	
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