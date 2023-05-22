make_shadow()
with instance_create_depth(0,0,0,obj_titlenpcshadow)
	assigned = other.id
time = 0
bobsin = 0

sprite_index = choose(
spr_lemonhead_idle,
spr_lemonhead_talk,
spr_updog_idle,
spr_updog_talk,
spr_sadguy_idle,
spr_sadguy_talk,
spr_father_idle,
spr_father_talk,
spr_redcritter_idle,
spr_redcritter_talk)