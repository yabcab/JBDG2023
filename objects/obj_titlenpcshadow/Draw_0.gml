if instance_exists(assigned)
	draw_sprite_ext(spr_npcballoonthing,assigned.image_index,assigned.x - 8,assigned.y + assigned.yoff + 8 + assigned.bobsin,assigned.image_xscale * assigned.facing,assigned.image_yscale,assigned.rot + assigned.image_angle,c_black,assigned.image_alpha / 3)