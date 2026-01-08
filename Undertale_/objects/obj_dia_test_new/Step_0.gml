/// @description Insert description here
// You can write your code in this editor

if(array_length(Dialog_List) <= text_current)
{
instance_destroy();
show_debug_message("TRIGGERD");
}

else
{


var _len = string_length(Dialog_List[text_current].Text);

if (keyboard_check_pressed(ord("X")) and char_current < _len)
{

	
	if (char_current < _len)
    {
		char_current = _len;
    }
}

if (keyboard_check_pressed(ord("Z")) and char_current >= _len)
{
	text_current += 1;
		
	if(array_length(Dialog_List) <= text_current)
	{
		obj_mainchara.State = Player_Next_State;
		instance_destroy();
			
	}
		
	else
	{
		
		
		if (variable_struct_exists(Dialog_List[text_current],"Portrait"))
		{
			var Dialouge_port = Dialog_List[text_current].Portrait;
			if (Dialouge_port != noone) 
			{
				Portrait = true;
				Dialog_List[text_current].Text = string_wrap(Dialog_List[text_current].Text, text_width - (sprite_get_width(Dialouge_port) + 15));
			}
			else 
			{
				Portrait = false;
				Dialog_List[text_current].Text = string_wrap(Dialog_List[text_current].Text, text_width);
			}
			
		}
		
		
		else 
		{
			Portrait = false;
			Dialog_List[text_current].Text = string_wrap(Dialog_List[text_current].Text, text_width);
		}

		
		char_current = 0;
		
		
	}
	    
    }
}
