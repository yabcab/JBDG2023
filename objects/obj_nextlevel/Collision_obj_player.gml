if !other.levelcomplete
{
	sprite_index = spr_flagpole_fly
	y -= 50
	repeat 50
		instance_create_depth(x,y,-1,obj_whiteparticle)
	
	alarm[0] = 75
	with other
	{
		levelcomplete = true
		state = states.normal
	}
}