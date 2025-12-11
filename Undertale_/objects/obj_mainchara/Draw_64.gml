if (State = State_Menu)
{
	draw_rectangle_colour(16, 154, 192, 336, c_white, c_white, c_white, c_white, false)
	draw_rectangle_colour(22, 160, 186, 330, c_black, c_black, c_black, c_black, false)
	draw_set_font(Font1)
	draw_text_transformed(68, 170, "ITEM", 3, 3, 0)
	draw_text_transformed(68, 220, "STAT", 3, 3, 0)
	draw_text_transformed(68, 270, "CELL", 3, 3, 0)
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
		draw_rectangle_colour(16, 154, 192, 336, c_white, c_white, c_white, c_white, false)
		draw_rectangle_colour(22, 160, 186, 330, c_black, c_black, c_black, c_black, false)
		draw_set_font(Font1)
		draw_text_transformed(68, 170, "ITEM", 3, 3, 0)
		draw_text_transformed(68, 220, "STAT", 3, 3, 0)
		draw_text_transformed(68, 270, "CELL", 3, 3, 0)
		draw_rectangle_colour(200, 100, 532, 475, c_white, c_white, c_white, c_white, false)
		draw_rectangle_colour(206, 106, 526, 469, c_black, c_black, c_black, c_black, false)
		draw_text_transformed(226, 120, "\"Echo\"", 2, 2, 0)
		draw_text_transformed(226, 180, "LV " + string(global.LOVE), 2, 2, 0)
		draw_text_transformed(226, 210, "HP " + string(global.Health) + "/" + string(global.MaxHealth), 2, 2, 0)
		draw_text_transformed(226, 270, "AT " + string(global.Attack) + " (" + string(global.WeaponEquipped.Attack) + ")", 2, 2, 0)
		draw_text_transformed(226, 300, "DF " + string(global.Defense) + " (" + string(global.ArmorEquipped.Defense) + ")", 2, 2, 0)
		draw_text_transformed(376, 270, "EXP: " + string(global.EXP), 2, 2, 0)
		draw_text_transformed(376, 300, "NEXT: " + string(global.NEXTLV), 2, 2, 0)
		draw_text_transformed(226, 360, "WEAPON: " + string(global.WeaponEquipped.Name), 2, 2, 0)
		draw_text_transformed(226, 390, "ARMOR: " + string(global.ArmorEquipped.Name), 2, 2, 0)
		draw_text_transformed(226, 430, "GOLD: " + string(global.Money), 2, 2, 0)
}
if (State = State_Inventory)
{
	draw_rectangle_colour(16, 154, 192, 336, c_white, c_white, c_white, c_white, false)
	draw_rectangle_colour(22, 160, 186, 330, c_black, c_black, c_black, c_black, false)
	draw_set_font(Font1)
	draw_text_transformed(68, 170, "ITEM", 3, 3, 0)
	draw_text_transformed(68, 220, "STAT", 3, 3, 0)
	draw_text_transformed(68, 270, "CELL", 3, 3, 0)
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
	for(var i = 0; i < array_length(global.Game_Data.Inventory_1); i ++)
	{
	draw_text_transformed(250, 120 + 30 * i, global.Game_Data.Inventory_1[i].Display_Name, 2, 2, 0)
	}
	draw_text_transformed(250, 120, global.Game_Data.Inventory_1[0].Display_Name, 2, 2, 0)
	
	draw_sprite(spr_heart, 0, 214, 130 + 30 * Inventory_Index);

}
if (State = State_Inventory_2)
{
	draw_rectangle_colour(16, 154, 192, 336, c_white, c_white, c_white, c_white, false)
	draw_rectangle_colour(22, 160, 186, 330, c_black, c_black, c_black, c_black, false)
	draw_set_font(Font1)
	draw_text_transformed(68, 170, "ITEM", 3, 3, 0)
	draw_text_transformed(68, 220, "STAT", 3, 3, 0)
	draw_text_transformed(68, 270, "CELL", 3, 3, 0)
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
	for(var i = 0; i < array_length(global.Game_Data.Inventory_1); i ++)
	{
	draw_text_transformed(250, 120 + 30 * i, global.Game_Data.Inventory_1[i].Display_Name, 2, 2, 0)
	}
	draw_text_transformed(250, 120, global.Game_Data.Inventory_1[0].Display_Name, 2, 2, 0)
	
	draw_sprite(spr_heart, 0, 211 + 100 * Item_Action_Index, 360);
}
