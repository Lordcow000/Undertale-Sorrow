/// @description Insert description here
// You can write your code in this editor

room_goto(new_room);

if (instance_exists(obj_mainchara))
{
    obj_mainchara.x = xx;
    obj_mainchara.y = yy; 
    obj_mainchara.last_dir = dir;
}