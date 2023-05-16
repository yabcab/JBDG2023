if !other.levelcomplete
{
	play_sfx(sfx_hitflag,false)
	sprite_index = spr_flagpole_fly
	y -= 50
	repeat 50
		instance_create_depth(x,y,-1,obj_whiteparticle)
	
	alarm[0] = 75
	with other
	{
		if state = states.rocket
			with instance_create_depth(x + (4 * facing),y - 20,-2,obj_killedrocket)
				image_xscale = other.facing
		levelcomplete = true
		state = states.normal
	}
}