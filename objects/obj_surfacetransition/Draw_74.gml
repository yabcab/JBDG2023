gpu_set_blendmode_ext(bm_one, bm_zero);
gpu_set_colorwriteenable(true, true, true, false);
if surface_exists(surf)
	draw_surface(surf,surfx,surfy)
gpu_set_colorwriteenable(true, true, true, true);
gpu_set_blendmode(bm_normal);