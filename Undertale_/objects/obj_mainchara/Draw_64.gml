if (State = State_Menu)
{
	show_debug_message("Ahh");
	draw_set_colour(c_white);
	draw_rectangle_colour(16, 154, 192, 10 + (170 + (50 * array_length(MenuSelect))) + 6, c_white, c_white, c_white, c_white, false)
	draw_rectangle_colour(22, 160, 186, 10 + (170 + (50 * array_length(MenuSelect))), c_black, c_black, c_black, c_black, false)
	for (var i = 0; i < array_length(MenuSelect); i++;)
	{
	draw_set_font(fnt_main)
	draw_text_transformed(68, 170 + (50 * i), MenuSelect[i], 3, 3, 0)
	}
	switch(Menu_Index)
	{
	case 0:
	draw_sprite(spr_heart, 0, 30, 185)
	break
	case 1:
	draw_sprite(spr_heart, 0, 30, 235)
	break
	case 2:
	draw_sprite(spr_heart, 0, 30, 285)
	break
	}
}
	if State = State_Stat
	{

		draw_rectangle_colour(16, 154, 192, 10 + (170 + (50 * array_length(MenuSelect))) + 6, c_white, c_white, c_white, c_white, false)
	draw_rectangle_colour(22, 160, 186, 10 + (170 + (50 * array_length(MenuSelect))), c_black, c_black, c_black, c_black, false)
	for (var i = 0; i < array_length(MenuSelect); i++;)
	{
	draw_set_font(fnt_main)
	draw_text_transformed(68, 170 + (50 * i), MenuSelect[i], 3, 3, 0)
	}
		draw_rectangle_colour(200, 100, 532, 475, c_white, c_white, c_white, c_white, false)
		draw_rectangle_colour(206, 106, 526, 469, c_black, c_black, c_black, c_black, false)
		draw_text_transformed(226, 120, "\"Echo\"", 2, 2, 0)
		draw_text_transformed(226, 180, "LV " + string(global.Game_Data.LOVE), 2, 2, 0)
		draw_text_transformed(226, 210, "HP " + string(global.Game_Data.Health) + "/" + string(global.Game_Data.MaxHealth), 2, 2, 0)
		draw_text_transformed(226, 270, "AT " + string(global.Game_Data.Attack) + "(" + string(global.Game_Data.WeaponEquipped.Attack) + ")", 2, 2, 0)
		draw_text_transformed(226, 300, "DF " + string(global.Game_Data.Defense) + "(" + string(global.Game_Data.ArmorEquipped.Defense) + ")", 2, 2, 0)
		draw_text_transformed(376, 270, "EXP: " + string(global.Game_Data.EXP), 2, 2, 0)
		draw_text_transformed(376, 300, "NEXT: " + string(global.Game_Data.NEXTLV), 2, 2, 0)
		draw_text_transformed(226, 360, "WEAPON:" + string(global.Game_Data.WeaponEquipped.Name), 2, 2, 0)
		draw_text_transformed(226, 390, "ARMOR:" + string(global.Game_Data.ArmorEquipped.Name), 2, 2, 0)
		draw_text_transformed(226, 430, "GOLD: " + string(global.Game_Data.Money), 2, 2, 0)
}
if (State = State_Inventory)
{
	draw_rectangle_colour(16, 154, 192, 10 + (170 + (50 * array_length(MenuSelect))) + 6, c_white, c_white, c_white, c_white, false)
	draw_rectangle_colour(22, 160, 186, 10 + (170 + (50 * array_length(MenuSelect))), c_black, c_black, c_black, c_black, false)
	for (var i = 0; i < array_length(MenuSelect); i++;)
	{
	draw_set_font(fnt_main)
	draw_text_transformed(68, 170 + (50 * i), MenuSelect[i], 3, 3, 0)
	}
	draw_rectangle_colour(200, 94, 506, 412, c_white, c_white, c_white, c_white, false)
	draw_rectangle_colour(206, 100, 500, 406, c_black, c_black, c_black, c_black, false)
	for(var i = 0; i < array_length(Item_Actions); i ++)
	{
	draw_text_transformed(231 + 100 * i, 350, Item_Actions[i], 2, 2, 0)
	}
	//Arrays aren't my strongest, help me do this
	//-Migo
	//gotcha - Wikibell
	//Thanks - Migo
	for(var i = 0; i < array_length(global.Game_Data.Inventory); i ++)
	{
	draw_text_transformed(250, 120 + 30 * i, Fetch_item(global.Game_Data.Inventory[i]).display_name, 2, 2, 0)
	}
	draw_text_transformed(250, 120, Fetch_item(global.Game_Data.Inventory[0]).display_name, 2, 2, 0)
	
	draw_sprite(spr_heart, 0, 214, 130 + 30 * Inventory_Index);

}
if (State = State_Inventory_2)
{
	draw_rectangle_colour(16, 154, 192, 10 + (170 + (50 * array_length(MenuSelect))) + 6, c_white, c_white, c_white, c_white, false)
	draw_rectangle_colour(22, 160, 186, 10 + (170 + (50 * array_length(MenuSelect))), c_black, c_black, c_black, c_black, false)
	for (var i = 0; i < array_length(MenuSelect); i++;)
	{
	draw_set_font(fnt_main)
	draw_text_transformed(68, 170 + (50 * i), MenuSelect[i], 3, 3, 0)
	}
	draw_rectangle_colour(200, 94, 506, 412, c_white, c_white, c_white, c_white, false)
	draw_rectangle_colour(206, 100, 500, 406, c_black, c_black, c_black, c_black, false)
	for(var i = 0; i < array_length(Item_Actions); i ++)
	{
	draw_text_transformed(231 + 100 * i, 350, Item_Actions[i], 2, 2, 0)
	}

	//Arrays aren't my strongest, help me do this
	//-Migo
	//gotcha - Wikibell
	//Thanks - Migo
	for(var i = 0; i < array_length(global.Game_Data.Inventory); i ++)
	{
	draw_text_transformed(250, 120 + 30 * i, Fetch_item(global.Game_Data.Inventory[i]).display_name, 2, 2, 0)
	}
	draw_text_transformed(250, 120, Fetch_item(global.Game_Data.Inventory[0]).display_name, 2, 2, 0)
	
	draw_sprite(spr_heart, 0, 211 + 100 * Item_Action_Index, 360);
}
