vsp = approach(vsp,18,0.5)

var walksp = 6
if gamepad_axis_value(0,gp_axislh) < 0
	hsp = -walksp
else if gamepad_axis_value(0,gp_axislh) > 0
	hsp = walksp
else
	hsp = 0
	
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