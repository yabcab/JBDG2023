with other
{
	if !levelcomplete && !broimdead
	{
		//x = checkpointx
		//y = checkpointy
		
		state = states.normal
		vsp = -7
		broimdead = true
		deadtimer = 60
		state = states.normal
		audio_stop_sound(sfx_getrocket)
		instance_create_depth(x,y,-100,obj_rescuebubble)
		
		play_sfx(sfx_bubblehit)
	}
}