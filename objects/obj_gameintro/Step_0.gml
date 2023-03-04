if fadestate = 0
{
	image_alpha = approach(image_alpha,1,0.021)	
	if image_alpha = 1 && !set1
	{
		set1 = true
		alarm[0] = 75
	}
}
else
{
	image_alpha = approach(image_alpha,0,0.021)	
	if image_alpha = 0 && !set2
	{
		
		if image_index < 2
		{
			alarm[1] = 1
			set2 = true	
		}
		else
		{
			rectalph = approach(rectalph,0,0.1)
			if gamepad_button_check_pressed(0,CONT_A)
				controllable = true
		}
	}
}