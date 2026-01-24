/// @description Insert description here
// You can write your code in this editor
choice_locked = false;

dialogue_list[0] = "";

text_width = 300;
text_x = 56;
text_y = 340;

char_current = 1;
text_current = 0;
char_speed = 1;
dialogue_advance = false;

Portrait = false;


obj_mainchara.State = obj_mainchara.State_Frozen;
Player_Next_State = obj_mainchara.State_Overworld;

pause_timer = 0;

choice = false;
ch_msg = -1;
ch[1] = "";
ch[2] = "";
ch[3] = "";
ch[4] = "";

ch_alpha = 1;
p = 1;
outcome = 0;

position = 0;

pauses = 
[
	".",
	"?",
	"!",
];
