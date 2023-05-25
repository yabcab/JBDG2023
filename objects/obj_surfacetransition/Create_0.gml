surf = surface_create(960,540)
surface_set_target(surf);
//draw_clear_alpha(c_black,1);
surface_copy(surf,0,0,application_surface)
surface_reset_target();


surfx = 0
surfy = 0

alarm[0] = 300

play_sfx(sfx_leveltransition,false)