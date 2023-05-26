if !firsttime
{
	if !surface_exists(surf)
		surf = surface_create(960,540)
	surface_set_target(surf);
	//draw_clear_alpha(c_black,1);
	surface_copy(surf,0,0,application_surface)
	surface_reset_target();
	firsttime = true
}