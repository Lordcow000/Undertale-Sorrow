/// @description Insert description here
// You can write your code in this editor
var xx = 104;
var yy = 104;
draw_sprite_ext(spr_menu_boxes, 1, xx, yy, 2.2, 1.70, image_angle, c_white, image_alpha);
draw_sprite_ext(spr_menu_boxes, 0, xx, yy, 2, 1.5, image_angle, image_blend, image_alpha);
var bbox_yscale = 2.5;
var bbox_yoffset = 140;
var bbox_yscale_multiplier = array_length(MenuSelect) - 3;
bbox_yscale += (0.6 * bbox_yscale_multiplier);
bbox_yoffset += (19.2 * bbox_yscale_multiplier);
draw_sprite_ext(spr_menu_boxes, 1, xx, yy + bbox_yoffset, 2.2, bbox_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(spr_menu_boxes, 0, xx, yy + bbox_yoffset, 2, bbox_yscale - 0.2, image_angle, image_blend, image_alpha);
draw_set_colour(c_white);
draw_set_font(fnt_stats);
draw_text_transformed(xx - 56, yy - 5, string_hash_to_newline ("LV " + string(global.Game_Data.LOVE)),2,2,0);
draw_text_transformed(xx - 56, yy + 10, string_hash_to_newline("HP " + string(global.Game_Data.Health) + "/" + string(global.Game_Data.MaxHealth)),2,2,0);
draw_text_transformed(xx - 56, yy + 25, string_hash_to_newline("G   " + string(global.Game_Data.Gold)),2,2,0);
draw_set_font(fnt_main);
draw_text_transformed(xx - 56, yy - 44, string_hash_to_newline(string(global.Game_Data.Name)),2,2,0);

for (var i = 0; i <= array_length(MenuSelect)-1; i++)
{
	draw_set_colour(c_white);
	if(MenuSelect[i] == "ITEM" && global.Game_Data.Inventory[0] == "Nothing")
	{
		draw_set_colour(c_gray);
	}
	draw_text_transformed(xx - 20, yy + 40 + (40 * (i+1)), string_hash_to_newline(MenuSelect[i]),2,2,0);
}

if (!Inventory_open && !Stats_open && !Cell_open)
{
    switch (Menu_Index)
    {
        case 0:
            draw_sprite(spr_heart_menu, 0, xx - 40, yy + 96);
            break;
        
        case 1:     
            draw_sprite(spr_heart_menu, 0, xx - 40, yy + 138);
            break;
        
        case 2:
            draw_sprite(spr_heart_menu, 0, xx - 40, yy + 176);
            break;
        
        case 3:
            draw_sprite(spr_heart_menu, 0, xx - 40, yy + 216);
            break;
        
        case 4:
            draw_sprite(spr_heart_menu, 0, xx - 40, yy + 256);
            break;
    }
}

if (Inventory_open)
{
	draw_sprite_ext(spr_menu_boxes, 1, xx + 250, yy + 112, 5.2, 5.2, image_angle, c_white, image_alpha);
    draw_sprite_ext(spr_menu_boxes, 0, xx + 250, yy + 112, 5, 5, image_angle, c_white, image_alpha);
    draw_set_colour(c_white);
    draw_set_font(fnt_main);
	
	if (!Item_inspect)
	{
		draw_sprite(spr_heart_menu, 0, xx + 110, (yy - 44) + (30 * (Inventory_Index + 1)));
	}
	
    for (var n = 0; n <= 7; n++)
    {
        if (global.Game_Data.Inventory[n] != "Nothing")
        {
            draw_text_transformed(xx + 130, (yy - 60) + ((n+1) * 30), string_hash_to_newline(Fetch_item(global.Game_Data.Inventory[n]).display_name),2,2,0);
        }
    }
	
	draw_text_transformed(xx + 130, yy + 230, string_hash_to_newline("USE"),2,2,0);
    draw_text_transformed(xx + 220, yy + 230, string_hash_to_newline("INFO"),2,2,0);
    draw_text_transformed(xx + 320, yy + 230, string_hash_to_newline("DROP"),2,2,0);
}

if (Item_inspect)
{
    switch(Inspect_index)
    {
        case 0:
            draw_sprite(spr_heart_menu, 0, xx + 110, yy + 246);
            break;
        
        case 1:
            draw_sprite(spr_heart_menu, 0, xx + 200, yy + 246);
            break;
        
        case 2:
            draw_sprite(spr_heart_menu, 0, xx + 300, yy + 246);
            break;
    }
}

if (Stats_open)
{
	draw_sprite_ext(spr_menu_boxes, 1, xx + 250, yy + 144, 5.2, 6.2, image_angle, c_white, image_alpha);
    draw_sprite_ext(spr_menu_boxes, 0, xx + 250, yy + 144, 5, 6, image_angle, c_white, image_alpha);
    draw_set_colour(c_white);
    draw_set_font(fnt_main);
    draw_text_transformed(xx + 114.4, yy - 20, string_hash_to_newline("\"Echo\""),2,2,0);
    draw_text_transformed(xx + 300, yy - 20, string_hash_to_newline("LV " + string(global.Game_Data.LOVE)),2,2,0);
    draw_text_transformed(xx + 114.4, yy + 20, string_hash_to_newline("HP " + string(global.Game_Data.Health) + " / " + string(global.Game_Data.MaxHealth)),2,2,0);
    draw_text_transformed(xx + 114.4, yy + 70, string_hash_to_newline("AT " + string(global.Game_Data.Attack) + "(" + string(global.Game_Data.WeaponEquipped.atk) + ")"),2,2,0);
    draw_text_transformed(xx + 114.4, yy + 100, string_hash_to_newline("DF " + string(global.Game_Data.Defense) + "(" + string(global.Game_Data.ArmorEquipped.def) + ")"),2,2,0);
    draw_text_transformed(xx + 260, yy + 70, string_hash_to_newline("EXP " + string(global.Game_Data.EXP)),2,2,0);
    
    //draw_text(xx + 260, yy + 100, string_hash_to_newline("NEXT " + string(level_up_treshhold))); next level
    draw_text_transformed(xx + 114.4, yy + 140, string_hash_to_newline("WEAPON: " + global.Game_Data.WeaponEquipped.display_name),2,2,0);
    draw_text_transformed(xx + 114.4, yy + 170, string_hash_to_newline("ARMOR: " + global.Game_Data.ArmorEquipped.display_name),2,2,0);
   
    draw_text_transformed(xx + 114.4, yy + 280, string_hash_to_newline("GOLD: " + string(global.Game_Data.Gold)),2,2,0);
}