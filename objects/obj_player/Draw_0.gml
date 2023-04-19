draw_sprite_ext(sprite_index,image_index,x,y + yoff,image_xscale * facing,image_yscale,image_angle,image_blend,image_alpha)
draw_sprite_ext(spr_npcarrow,arrowframe,x,y - 75 + arrowoff + arrowbob,1,1,0,c_white,arrowalph)
draw_text(x - 20,y - 20,string(hasdoublejump))