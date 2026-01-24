// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_item_info(Item){
	
	scr_gen_dialoguer();
	show_debug_message("Called")
	
	
	
	with (msg)
	{
		msg_length = array_length(Item.desc);
		
		for(i = 0; i < msg_length; i++)
		{
			dialogue_list[i] = Item.desc[i];
		}
		
	}
	

}