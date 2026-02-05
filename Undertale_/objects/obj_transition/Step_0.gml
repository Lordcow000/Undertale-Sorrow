/// @description Insert description here
// You can write your code in this editor

if(!fade_in)
{
	trans_alpha += fade_in_speed;
}
else
{
	trans_alpha -= fade_out_speed;
}

if(trans_alpha >= 1)
{
	
	room_goto(new_room);

	if (instance_exists(obj_mainchara))
	{
	    obj_mainchara.x = xx;
	    obj_mainchara.y = yy; 
	    obj_mainchara.last_dir = dir;
	}
	fade_in = true;
}