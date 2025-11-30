if (State = State_Menu)
{
	draw_rectangle_colour(16, 160, 160, 330, c_black, c_black, c_black, c_black, false)
	draw_rectangle_colour(16, 160, 160, 330, c_white, c_white, c_white, c_white, true)
	draw_set_font(Font1)
	draw_text_transformed(60, 170, "ITEM", 3, 3, 0)
	draw_text_transformed(60, 220, "STAT", 3, 3, 0)
	draw_text_transformed(60, 270, "CELL", 3, 3, 0)
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
		draw_rectangle_colour(16, 160, 160, 330, c_black, c_black, c_black, c_black, false)
		draw_rectangle_colour(16, 160, 160, 330, c_white, c_white, c_white, c_white, true)
		draw_set_font(Font1)
		draw_text_transformed(60, 170, "ITEM", 3, 3, 0)
		draw_text_transformed(60, 220, "STAT", 3, 3, 0)
		draw_text_transformed(60, 270, "CELL", 3, 3, 0)
		draw_rectangle_colour(200, 100, 500, 475, c_black, c_black, c_black, c_black, false)
		draw_rectangle_colour(200, 100, 500, 475, c_white, c_white, c_white, c_white, true)
		draw_text_transformed(220, 120, "\"Echo\"", 2, 2, 0)
		draw_text_transformed(220, 180, "LV " + string(global.LOVE), 2, 2, 0)
		draw_text_transformed(220, 210, "HP " + string(global.Health) + "/" + string(global.MaxHealth), 2, 2, 0)
		draw_text_transformed(220, 270, "AT " + string(global.Attack) + " (" + string(global.WeaponEquipped.Attack) + ")", 2, 2, 0)
		draw_text_transformed(220, 300, "DF " + string(global.Defense) + " (" + string(global.ArmorEquipped.Defense) + ")", 2, 2, 0)
		draw_text_transformed(370, 270, "EXP: " + string(global.EXP), 2, 2, 0)
		draw_text_transformed(370, 300, "NEXT: " + string(NEXTLV), 2, 2, 0)
		draw_text_transformed(220, 360, "WEAPON: " + string(global.WeaponEquipped.Name), 2, 2, 0)
		draw_text_transformed(220, 390, "ARMOR: " + string(global.ArmorEquipped.Name), 2, 2, 0)
		draw_text_transformed(220, 430, "GOLD: " + string(global.Money), 2, 2, 0)
}
if (State = State_Inventory)
{
	draw_rectangle_colour(16, 160, 160, 330, c_black, c_black, c_black, c_black, false)
	draw_rectangle_colour(16, 160, 160, 330, c_white, c_white, c_white, c_white, true)
	draw_set_font(Font1)
	draw_text_transformed(60, 170, "ITEM", 3, 3, 0)
	draw_text_transformed(60, 220, "STAT", 3, 3, 0)
	draw_text_transformed(60, 270, "CELL", 3, 3, 0)
	draw_rectangle_colour(200, 100, 500, 400, c_black, c_black, c_black, c_black, false)
	draw_rectangle_colour(200, 100, 500, 400, c_white, c_white, c_white, c_white, true)
	draw_text_transformed(220, 350, "USE", 2, 2, 0)
	draw_text_transformed(320, 350, "INFO", 2, 2, 0)
	draw_text_transformed(420, 350, "DROP", 2, 2, 0)
	//Arrays aren't my strongest, help me do this
	//-Migo
	draw_text_transformed(240, 120, global.Game_Data.Inventory_1[0].Name, 2, 2, 0)
}
