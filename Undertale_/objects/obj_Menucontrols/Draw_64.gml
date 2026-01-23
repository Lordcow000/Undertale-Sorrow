draw_set_font(fnt_main)
	if Savefilexists = true
	{
		switch MenuIndex
{
	case 0:
	draw_text_transformed_colour(170, 235, "Continue", 2, 2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1)
	draw_text_transformed_colour(390, 235, "Reset", 2, 2, 0, c_white, c_white, c_white, c_white, 1)
	draw_text_transformed_colour(264, 275, "Settings", 2, 2, 0, c_white, c_white, c_white, c_white, 1)
	break
	case 1:
	draw_text_transformed_colour(170, 235, "Continue", 2, 2, 0, c_white, c_white, c_white, c_white, 1)
	draw_text_transformed_colour(390, 235, "Reset", 2, 2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1)
	draw_text_transformed_colour(264, 275, "Settings", 2, 2, 0, c_white, c_white, c_white, c_white, 1)
	break
	case 2:
	draw_text_transformed_colour(170, 235, "Continue", 2, 2, 0, c_white, c_white, c_white, c_white, 1)
	draw_text_transformed_colour(390, 235, "Reset", 2, 2, 0, c_white, c_white, c_white, c_white, 1)
	draw_text_transformed_colour(264, 275, "Settings", 2, 2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1)
	break
	}
	}
	else
	{
switch MenuIndex
{
	case 0:
	draw_text_transformed_colour(170, 235, "Continue", 2, 2, 0, c_ltgrey, c_ltgrey, c_ltgrey, c_ltgrey, 1)
	draw_text_transformed_colour(390, 235, "Reset", 2, 2, 0, c_white, c_white, c_white, c_white, 1)
	draw_text_transformed_colour(264, 275, "Settings", 2, 2, 0, c_white, c_white, c_white, c_white, 1)
	break
	case 1:
	draw_text_transformed_colour(170, 235, "Continue", 2, 2, 0, c_grey, c_grey, c_grey, c_grey, 1)
	draw_text_transformed_colour(390, 235, "Reset", 2, 2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1)
	draw_text_transformed_colour(264, 275, "Settings", 2, 2, 0, c_white, c_white, c_white, c_white, 1)
	break
	case 2:
	draw_text_transformed_colour(170, 235, "Continue", 2, 2, 0, c_grey, c_grey, c_grey, c_grey, 1)
	draw_text_transformed_colour(390, 235, "Reset", 2, 2, 0, c_white, c_white, c_white, c_white, 1)
	draw_text_transformed_colour(264, 275, "Settings", 2, 2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1)
	break
}
	}