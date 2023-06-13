//nerd code
if distance_to_object(obj_player) < abs(obj_player.hsp) + 10 && obj_player.state = states.floured
{	
	play_sfx(sfx_cratehit)
	repeat 10
		with instance_create_depth(x + 32,y + 32,-1,obj_cratepart)
		{
			hspeed = (obj_player.hsp / 2) + random_range(-2,2)
			vspeed = random_range(-6,-3)
		}
		
	instance_destroy()
	repeat 20
		instance_create_depth(x + 32,y + 32,depth,obj_whiteparticle)
}