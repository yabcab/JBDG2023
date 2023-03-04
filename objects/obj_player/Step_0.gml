vsp = approach(vsp,18,0.5)

if controllable
{
	var axdir = gamepad_axis_value(0,gp_axislh)
	var holdrun = 0 //gamepad_button_check(0,CONT_RT)
	var runsp = 3
	var walksp = 12
	if axdir < 0
		hsp = approach(hsp,-walksp - (holdrun * runsp),0.25)
	else if axdir > 0
		hsp = approach(hsp,walksp + (holdrun * runsp),0.25)
	else
		hsp = approach(hsp,0,0.5)
	
	if (grounded || place_meeting(x,y + 20,obj_solid)) && gamepad_button_check_pressed(0,CONT_A)
	{
		vsp = -15
		jumping = true
	}
	if jumping && vsp < -3 && !gamepad_button_check(0,CONT_A)
	{
		vsp = -3
		jumping = false
	}
	
	if place_meeting(x + hsp,y,obj_solid) && abs(hsp) > 4
	{
		x -= hsp
		hsp *= -0.75
	}
}