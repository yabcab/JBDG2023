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
		if image_index < 2
		{
			alarm[1] = 20
			set2 = true	
		}
		else
		{
			rectalph = approach(rectalph,0,0.1)
			if (gamepad_button_check_pressed(0,CONT_A) || KEY_JMP_P) && !pressedme
			{
				//controllable = true
				//pressedme = true
			}
		}
	}
}

if !activated && audio_sound_get_track_position(titlemusic) >= 19.2
	activated = true
	
if activated
{
	veroff = lerp(veroff,0,0.2)
	
}