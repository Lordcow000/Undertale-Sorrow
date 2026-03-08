// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_gen_bubble_lordcow_solo(e)
{
	enemy = global.battle.enemies[e]
	if(enemy.killed || enemy.spared)
	{
		return;
	}
	
	randomise();

	switch 0 //irandom_range(0,2)
	{
		case 0:
			dialogue = "Moooooooo"
			break;	
	}
	
	if(enemy.last_act == "flirt")
	{
		dialogue = "(blushes#deeply)"
	}
	b = instance_create_layer(400, 80, "Instances", obj_bubble);
	t = instance_create_layer(b.x+15,b.y+10,"Instances",obj_dialogue_battle_bubble);
	
	t._message[0] = dialogue;
	t.bubble = b;
	
	
	
	
	
}