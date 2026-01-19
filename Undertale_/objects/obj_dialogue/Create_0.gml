/// @description Insert description here
// You can write your code in this editor


Dialog_List[0] = "";

text_width = 300;
text_x = 56;
text_y = 340;

char_current = 1;
text_current = 0;
char_speed = 1;
dialogue_advance = false;

Portrait = false;

Player_Next_State = obj_mainchara.State_Overworld;

pause_timer = 0;

pauses = 
[
	".",
	"?",
	"!",
];
