draw_text(3,500 + veroff,"Ver. DEV-" + date_date_string(GM_build_date))

draw_set_color(c_black)
draw_set_alpha(rectalph)
draw_rectangle(0,0 - yoff,960,540 - yoff,false)
draw_set_alpha(1)
draw_set_color(c_white)
if image_index != 2 || fadestate = 0// this is hell to make work
	draw_sprite_ext(sprite_index,image_index,x,y - yoff,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
else
	draw_sprite_ext(sprite_index,image_index,x,y - yoff,image_xscale,image_yscale,image_angle,image_blend,1)