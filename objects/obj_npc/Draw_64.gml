var xx = 20
var yy = 450 + textbox_yoff
if !surface_exists(surf)
	surf = surface_create(960,105)
surface_set_target(surf)
draw_sprite_tiled(drawnbg,0,xscroll,yscroll)
surface_reset_target()
draw_surface(surf,0,435 + textbox_yoff)
draw_sprite(spr_textbox_border,0,0,textbox_yoff)
draw_set_font(fnt_game)
draw_text(xx,yy,textcopy)