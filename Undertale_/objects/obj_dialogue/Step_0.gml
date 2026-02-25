/// @description Insert description here
// You can write your code in this editor

if(array_length(dialogue_list) <= text_current)
{
	instance_destroy();
}


var _len = string_length(dialogue_list[text_current]);
dialogue_advance = false;

if (scr_multicheck_pressed(1) and char_current < _len)
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
		var current_char = string_char_at(dialogue_list[text_current], char_current + 1);
		var next_char = string_char_at(dialogue_list[text_current], char_current + 2);
		var next_next_char = string_char_at(dialogue_list[text_current], char_current + 3);

		switch (current_char)
		{
			case ".":
				pause_timer = 20;
				char_current += 1;
				break;
			case "?":
				pause_timer = 20;
				char_current += 1;
				break

			case ",":
				pause_timer = 10;
				char_current += 1;
				break;
			case "-":
				pause_timer = 15;
				char_current += 1;
				break
				
			case "/":
				switch (next_char)
				{
					case "W":
						pause_timer = real(next_next_char)*60;
						char_current += 3;
						break
				}
				break


			default:
				
				char_current += char_speed;
				current_char = string_char_at(dialogue_list[text_current], char_current + 1);
				if( current_char != " " && current_char != "  ")
				{
					audio_stop_sound(snd_talk);
					audio_play_sound(snd_talk,80,false);
				}
					
				
				break;	
			
			
		}
	}
}





else if (scr_multicheck_pressed(0))
{
	if (choice == false)
	{
		dialogue_advance = true;
	}
}

script_execute(scr_choicer);

if (dialogue_advance)
{
	if ((text_current + 1) < array_length(dialogue_list))
	{
		text_current += 1;
		char_current = 0;
		pause_timer = 0;
	}
	
	else
	{
		obj_mainchara.State = obj_mainchara.State_Overworld;
		instance_destroy();
	}
}
