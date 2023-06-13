time++
bobsin = sin(time / 30) * 5
	
if obj_gameintro.activated
{
	if canpress
		y = lerp(y,ystart,0.1)
	else
		y = lerp(y,600,0.1)
	if canpress && (KEY_JMP_P || gamepad_button_check_pressed(0,CONT_A))
	{
		alarm[0] = 120
		canpress = false	
		audio_stop_all()
		play_sfx(sfx_playgame,false)
	}
}