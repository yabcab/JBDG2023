with other
{
	if state != states.rocket
	{
		state = states.rocket
		facing = other.image_xscale
		hsp = 5 * other.image_xscale
		vsp = 0
	}
}