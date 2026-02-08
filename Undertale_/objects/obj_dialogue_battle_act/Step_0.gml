/// @description Insert description here
// You can write your code in this editor

if(array_length(_message) <= text_current)
{
	instance_destroy();
}


var _len = string_length(_message[text_current]);

if (scr_multicheck_pressed(1) and char_current < _len)
{
	char_current = _len
	pause_timer = 0;
}

if (pause_timer > 0)
{
	pause_timer--;
}

if (char_current < _len)
{
	var current_char = string_char_at(_message[text_current], char_current + 1);
	var next_char = string_char_at(_message[text_current], char_current + 2);
		

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

else if (scr_multicheck_pressed(0) && pause_timer <= 0)
{
	dialogue_advance = true;
}


if (dialogue_advance)
{
	if ((text_current + 1) < array_length(_message))
	{
		dialogue_advance = false;
		text_current += 1;
		char_current = 0;
		pause_timer = 0;
	}
	
	else
	{
		instance_destroy();
	}
}

