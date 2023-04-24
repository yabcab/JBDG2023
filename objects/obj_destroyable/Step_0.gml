if distance_to_object(obj_player) < abs(obj_player.hsp) + 3 && obj_player.state = states.rocket
{
	instance_destroy()
	
	repeat 10
	with instance_create_depth(x + 16,y + 16,-1,obj_cratepart)
	{
		hspeed = (obj_player.hsp / 2) + random_range(-2,2)
		vspeed = random_range(-6,-3)
	}
}