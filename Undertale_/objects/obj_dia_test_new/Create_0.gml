/// @description Insert description here
// You can write your code in this editor

dialogue_list = [];

text_width = 300;
text_x = 56;
text_y = 340;

char_current = 1;
text_current = 0;
char_speed = 1;

portrait = false;

Player_Next_State = obj_mainchara.State_Overworld;

waited = false;
waited_custom = false;
paused = false;

pauses = 
[
	".",
	"?",
	"!",
];
