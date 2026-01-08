if State = State_Save
{
	if Saved = false
	{
	draw_rectangle_colour(108, 118, 531, 291, c_white, c_white, c_white, c_white, false)
	draw_rectangle_colour(114, 124, 525, 285, c_black, c_black, c_black, c_black, false)
	draw_text_transformed(140, 165, "Echo", 2, 2, 0)
	draw_text_transformed(300, 165, "LV" + string(global.Game_Data.LOVE), 2, 2, 0)
	draw_text_transformed(140, 205, name, 2, 2, 0)
	draw_text_transformed(170, 265, "Save", 2, 2, 0)
	draw_text_transformed(350, 265, "Return", 2, 2, 0)
	switch(Save_Select)
	{
		case 0:
		draw_sprite(spr_heart, 0, 160, 265)
		break
		case 1:
		draw_sprite(spr_heart, 0, 340, 265)
		break
	}
	}
	else
	{
	draw_set_color(c_yellow)
	draw_rectangle_colour(108, 118, 531, 291, c_white, c_white, c_white, c_white, false)
	draw_rectangle_colour(114, 124, 525, 285, c_black, c_black, c_black, c_black, false)
	draw_text_transformed(140, 165, "Echo", 2, 2, 0)
	draw_text_transformed(300, 165, "LV" + string(global.Game_Data.LOVE), 2, 2, 0)
	draw_text_transformed(140, 205, name, 2, 2, 0)
	draw_text_transformed(170, 265, "File Saved.", 2, 2, 0)
	}
}