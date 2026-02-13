/// @description Insert description here
// You can write your code in this editor
var _len = string_length(_message[text_current]);

if (scr_multicheck_pressed(1) and char_current < _len)
{
	char_current = _len
}


if (char_current < _len)
{
	char_current += char_speed;
}

else if (scr_multicheck_pressed(0))
{
	instance_destroy();
}


