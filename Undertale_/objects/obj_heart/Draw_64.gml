draw_rectangle_colour(32, 250, 606, 389, c_black, c_black, c_black, c_black, false)
draw_rectangle_colour(32, 250, 606, 389, c_white, c_white, c_white, c_white, true)
switch(Selec_Index)
	{
		case 0:
		draw_sprite(spr_fight, 1, 32, 432)
		draw_sprite(spr_act, 0, 185, 432)
		draw_sprite(spr_item, 0, 338, 432)
		draw_sprite(spr_mercy, 0, 491, 432)
		break
		case 1:
		draw_sprite(spr_fight, 0, 32, 432)
		draw_sprite(spr_act, 1, 185, 432)
		draw_sprite(spr_item, 0, 338, 432)
		draw_sprite(spr_mercy, 0, 491, 432)
		break
		case 2:
		draw_sprite(spr_fight, 0, 32, 432)
		draw_sprite(spr_act, 0, 185, 432)
		draw_sprite(spr_item, 1, 338, 432)
		draw_sprite(spr_mercy, 0, 491, 432)
		break
		case 3:
		draw_sprite(spr_fight, 0, 32, 432)
		draw_sprite(spr_act, 0, 185, 432)
		draw_sprite(spr_item, 0, 338, 432)
		draw_sprite(spr_mercy, 1, 491, 432)
		break
	}
if State = State_Selec
{
	draw_text_transformed(52, 281, string_hash_to_newline("* You feel like you're not gonna get #copyrighted."), 2, 2, 0)
}