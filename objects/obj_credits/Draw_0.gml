draw_set_halign(fa_middle)
//draw_text_color(480 - 8,540 + credheight + 8,creditstring,c_black,c_black,c_black,c_black,0.4)
draw_sprite(sprite_index,image_index,480,630 + credheight)
draw_text(480,680 + credheight,creditstring)
draw_sprite(spr_creditshappybirthday,0,480,690 + string_height(creditstring) + credheight)
draw_set_halign(fa_left)
draw_set_alpha(fadeamount)
draw_rectangle_color(0,0,960,540,c_black,c_black,c_black,c_black,false)
draw_set_alpha(1)