with other
{
	if state = states.floured
	{
		state = states.normal
		repeat 45
			instance_create_depth(x,y,depth,obj_whiteparticle)
	}
}