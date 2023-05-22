/// @description balloon spawns

alarm[3] = irandom_range(50,300) // this could very well be too much

if obj_gameintro.activated
	instance_create_depth(random_range(20,940),610,depth,obj_titleballoon)
	