/// @description Insert description here
// You can write your code in this editor

if(array_length(Dialog_List) <= text_current)
{
instance_destroy();
}


var _len = string_length(Dialog_List[text_current]);
dialogue_advance = false;

if (keyboard_check_pressed(ord("X")) and char_current < _len)
{
	char_current = _len
	pause_timer = 0;
}


if (char_current < _len)
{
    if (pause_timer > 0)
	{
		pause_timer--;
	}
	else
	{
		var current_char = string_char_at(Dialog_List[text_current], char_current + 1);
		var next_char = string_char_at(Dialog_List[text_current], char_current + 2);

		switch (current_char)
		{
			case ".":
				pause_timer = 20;
				char_current += 1;
				break;

			case ",":
				pause_timer = 10;
				char_current += 1;
				break;
			case "/":
				pause_timer = real(next_char)*60;
				char_current += 1;

			default:
				char_current += char_speed;
				break;
		}
	}
}





else if (keyboard_check_pressed(ord("Z")))
{
	dialogue_advance = true;
}

if (dialogue_advance)
{
	if (text_current + 1) < array_length(Dialog_List)
	{
		text_current += 1;
		char_current = 0;
	}
	
	else
	{
		obj_mainchara.State = obj_mainchara.State_Overworld;
		instance_destroy();
	}
}
