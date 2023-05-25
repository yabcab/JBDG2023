if obj_gameintro.activated
{
	y = lerp(y,whereiwannabe,0.1)	
	if KEY_JMP_P || gamepad_button_check_pressed(0,CONT_A)
		room_goto(rm_intro)
}

time++
bobsin = sin(time / 30) * 6
rotsin = sin(time / 60) * 7