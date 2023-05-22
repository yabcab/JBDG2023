/// @description flying npc spawns

alarm[2] = irandom_range(200,1000)

if obj_gameintro.activated
	with instance_create_depth(x,y,depth,obj_titlenpc)
	{
		hspeed = 5 * other.image_xscale
		y = random_range(other.bbox_bottom - 64,other.bbox_top)
	}