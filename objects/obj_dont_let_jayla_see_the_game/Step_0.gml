if !currpaused
{
	var window_unfocus = !window_has_focus()
	var override = os_type = os_windows
	
	if (window_unfocus) && !override
	{
		currpaused = true
		instance_deactivate_all(true)
		audio_pause_all()
		needunpause = true
	}
}
else if needunpause && (KEY_JMP_P || gamepad_button_check_pressed(0,CONT_A))
{
	needunpause = false
	audio_resume_all()
	instance_activate_all()
	currpaused = false
}

hue++
if hue > 255
	hue -= 255
col = make_color_hsv(hue,175,200)