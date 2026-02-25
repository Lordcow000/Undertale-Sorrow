// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_caster_loop(song,gain=1,pitch=1)
{
	audio_play_sound(song,120,true,gain,0,pitch);
}