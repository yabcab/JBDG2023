if !hit
{
	with other
	{
		checkpointx = other.x
		checkpointy = other.y
	}
	
	play_sfx(sfx_hitflag)
	hit = true
	repeat 40
		instance_create_depth(x,y,depth,obj_confetti)
}