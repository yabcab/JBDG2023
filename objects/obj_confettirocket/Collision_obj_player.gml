with other
{
	if state != states.rocket && !broimdead
	{
		play_sfx(sfx_getrocket)
		state = states.rocket
		facing = other.image_xscale
		hsp = 5 * other.image_xscale
		vsp = 0
	}
}