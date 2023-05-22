/// @description angry enemy spawns

alarm[1] = irandom_range(200,1000)

if obj_gameintro.activated
	with instance_create_depth(x,y,depth,obj_enemyunkillable)
	{
		facing = other.image_xscale
		while !place_meeting(x,y + 1,obj_solid)
			y++
	}