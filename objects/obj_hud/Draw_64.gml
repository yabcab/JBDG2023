if room != rm_title && room != rm_disclaimer && room != rm_finish
{
	draw_sprite_ext(spr_hudelems,0,-8,8,1,1,0,c_black,0.33)
	draw_sprite(spr_hudelems,0,0,0)

	draw_set_halign(fa_left)
	draw_text(43,20,string(coins))
	draw_text(817,20,string(points))
	draw_text(43,70,string(deaths))
}