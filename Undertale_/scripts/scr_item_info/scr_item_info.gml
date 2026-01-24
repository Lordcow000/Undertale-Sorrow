// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_item_info(Item){
	
	msg = instance_create_layer(x,y,"Instances",obj_dialogue);
	
	
	
	with (msg)
	{
		msg_length = array_length(Item.desc);
		
		for(i = 0; i < msg_length; i++)
		{
			dialogue_list[i] = Item.desc[i];
		}
		
	}
	

}