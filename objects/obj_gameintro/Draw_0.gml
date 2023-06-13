draw_text(3,500 + veroff + bobsin,"Ver. " + version)

draw_set_color(c_black)
draw_set_alpha(rectalph)
draw_rectangle(0,y,960,y + 540,false)
draw_set_alpha(1)
draw_set_color(c_white)

draw_sprite_ext(sprite_index,image_index,x - 8,y + yoff + 8,image_xscale,image_yscale,image_angle,c_black,0.3)

if image_index != 2 || fadestate = 0// this is hell to make work
	draw_sprite_ext(sprite_index,image_index,x,y + yoff,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
else
	draw_sprite_ext(sprite_index,image_index,x,y + yoff,image_xscale,image_yscale,image_angle,image_blend,1)

