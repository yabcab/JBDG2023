if room != rm_title && room != rm_disclaimer && room != rm_finish
{
	draw_sprite_ext(spr_hudelems,0,-8,8,1,1,0,c_black,0.33)
	draw_sprite(spr_hudelems,0,0,0)

	draw_set_halign(fa_left)
	draw_text(43,20,string(coins))
	draw_text(817,20,string(points))
	draw_text(43,70,string(deaths))
	
	//draw_set_halign(fa_right)
	//var s, m, h
	//if timer_sec < 10
	//	s = "0" + string(timer_sec)
	//else
	//	s = string(timer_sec)
	//if timer_min < 10
	//	m = "0" + string(timer_min)
	//else
	//	m = string(timer_min)
	//h = string(timer_hour)
	//draw_text(950,510,h + ":" + m + ":" + s)
}