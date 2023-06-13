//nerd code
if distance_to_object(obj_player) < abs(obj_player.hsp) + 10 && obj_player.state = states.floured
{	
	play_sfx(sfx_cratehit)
	instance_destroy()
	repeat 30
		instance_create_depth(x + 32,y + 32,depth,obj_whiteparticle)
}