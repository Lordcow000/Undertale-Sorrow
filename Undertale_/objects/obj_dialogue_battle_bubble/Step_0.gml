/// @description Insert description here
// You can write your code in this editor
var _len = string_length(_message[text_current]);


if (pause_timer > 0)
{
	pause_timer--;
}

else if (char_current < _len && !done)
{
	alarm[0] = char_speed;
	done = true;
}

if(char_current == _len && !destruction_iminent)
{
	destruction_iminent = true;
	alarm[1] = 180;
}

