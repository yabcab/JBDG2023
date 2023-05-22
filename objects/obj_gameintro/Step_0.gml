if fadestate = 0
{
	image_alpha = approach(image_alpha,1,0.0265)	// this is some precise shit right here
	if image_alpha = 1 && !set1
	{
		set1 = true
		alarm[0] = 150
	}
}
else
{
	image_alpha = approach(image_alpha,0,0.0265)	
	if image_alpha = 0 && !set2
	{
		if image_index != 2
		{
			alarm[1] = 17
			set2 = true	
		}
		else
		{
			alarm[2] = 1
			set2 = true	
		}
	}
}

if !activated && audio_sound_get_track_position(titlemusic) >= 19.1
	activated = true
	
if activated
{
	veroff = lerp(veroff,0,0.2)
	
}

if goup
{
	upspeed = approach(upspeed,20,0.25)
	yoff += upspeed
}