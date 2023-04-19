if !other.levelcomplete
{
	repeat 50
		instance_create_depth(x,y,-1,obj_whiteparticle)
	
	alarm[0] = 75
	with other
	{
		levelcomplete = true
		state = states.normal
	}
}