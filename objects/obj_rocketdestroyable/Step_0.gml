if distance_to_object(obj_player) < abs(obj_player.hsp) + 3 && obj_player.state = states.rocket
{
	// todo add new sound for that
	//play_sfx(sfx_cratehit)
	repeat 10
		with instance_create_depth(x + 32,y + 32,-1,obj_cratepart)
		{
			sprite_index = spr_confettiblockparts
			image_index = irandom_range(0,7)
			hspeed = (obj_player.hsp / 2) + random_range(-2,2)
			vspeed = random_range(-6,-3)
		}
		
	instance_destroy()
}