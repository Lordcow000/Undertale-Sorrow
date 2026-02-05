// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_choicer(){
if (outcome == p && choice == false)
{
    if ((text_current + 1) < array_length(dialogue_list))
    {
        text_current += 1;
        char_current = 0;
		pause_timer = 0;
    }
    else
    {
        instance_destroy(other);
    }
	outcome = 0;
	
	
}

if (text_current == ch_msg)
{
	choice = true;
}

	var right = keyboard_check_pressed(vk_right);
	var left = keyboard_check_pressed(vk_left);
	var up = keyboard_check_pressed(vk_up);
	var down = keyboard_check_pressed(vk_down);
    
    if (choice == true && char_current >= string_length(dialogue_list[text_current]))
    {
        switch (p)
        {
            case 1:
                if (right && ch[2] != "")
                    p = 2;
                
                if (down && ch[3] != "")
                    p = 3;
                
                break;
            
            case 2:
                if (left)
                    p = 1;
                
                if (down)
                {
                    if (ch[4] != "")
                        p = 4;
                    else if (ch[3] != "")
                        p = 3;
                }
                
                break;
            
            case 3:
                if (right && ch[4] != "")
                    p = 4;
                
                if (up)
                    p = 1;
                
                break;
            
            case 4:
                if (up)
                    p = 2;
                
                if (left)
                    p = 3;
                
                break;
        }
        
        if (ch[2] != "" && (right || down || up || left))
        {
			//where we would play a sound
		}
        
        if (keyboard_check_pressed(ord("Z")))
        {
            outcome = p;
			choice = false;

            
        }
    }
}