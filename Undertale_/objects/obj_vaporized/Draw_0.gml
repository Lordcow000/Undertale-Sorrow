/// @description Insert description here
// You can write your code in this editor

dn = 1;
ht_a = sprite_height - (line * 4);
ht_b = y + (line * 4);
ht_c = line * 4;

if (dn == 1)
    draw_sprite_part(sprite_index, image_index, 0, ht_c, wd, ht_a, x, ht_b);


if(!done)
{

	draw_offset = 0;
	my_char = "0";
	while(my_char != "~" && my_char != "}" && char < string_length(test_string))
	{
		my_char = string_char_at(test_string,char+1);
		
		draw_set_colour(c_black);
		
		if(ord(my_char) >= 84 && ord(my_char) <= 121)
		{
			for (i = 0; i < (ord(my_char) - 85); i += 1)
		            draw_offset += 2;
		}
		
		draw_set_colour(c_white);
		
		if(ord(my_char) >= 39 && ord(my_char) <= 82)
		{
			if(wd > 120)
			{
				px = instance_create_layer(x + draw_offset, y + line*4,"Instances",obj_white_px);
				px.image_xscale = ord(my_char) - 40;
				draw_offset += (ord(my_char) - 40)*2;
			}
			else
			{
				for (i = 0; i < (ord(my_char) - 40); i += 1)
		        {
					instance_create_layer(x + draw_offset, y + (line*4) + 2,"Instances",obj_white_px);
					draw_offset += 2;
				}
				
			}
				
		}
		char += 1;
	}
	
				
		
			
	draw_offset = 0;
	line += 1;
		
	if (my_char == "~")
	{
		done = true;
		instance_destroy();
		exit;
	}
		
	else
	{
	    alarm[0] = 1 + delay;
	}
	
		
		
}
