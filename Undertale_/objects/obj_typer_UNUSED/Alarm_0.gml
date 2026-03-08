/// @description Insert description here
// You can write your code in this editor
char_current += 1;
current_char = string_char_at(dialogue_list[text_current], char_current + 1);
if( current_char != " " && current_char != "  ")
{
	audio_stop_sound(snd_talk);
	audio_play_sound(snd_talk,80,false);
}
done = false;