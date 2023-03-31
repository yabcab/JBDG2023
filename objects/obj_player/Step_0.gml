time++
vsp = approach(vsp,18,0.5)

if controllable
{
	var axdir = gamepad_axis_value(0,gp_axislh)
	if KEY_L
		axdir = -1
	if KEY_R
		axdir = 1
	var holdrun = 0 //gamepad_button_check(0,CONT_RB)
	var runsp = 3
	var walksp = 12
	
	if levelcomplete
	{
		hsp = approach(hsp,0,0.5)
		vsp = approach(vsp,0,0.5)
		yoffspeed += 0.175 // too lazy to cap the speed
		yoff -= yoffspeed
	}
	else
	{
		if axdir != 0
			facing = sign(axdir)
		if axdir < 0
			hsp = approach(hsp,-walksp - (holdrun * runsp),0.25)
		else if axdir > 0
			hsp = approach(hsp,walksp + (holdrun * runsp),0.25)
		else
			hsp = approach(hsp,0,0.5)
	
		if (grounded || place_meeting(x,y,obj_airjump) || place_meeting(x,y + 20,obj_solid)) && (gamepad_button_check_pressed(0,CONT_A) || KEY_JMP_P)
		{
			play_sfx(sfx_jump)
			vsp = -15
			jumping = true
		}
		if jumping && vsp < -3 && (!gamepad_button_check(0,CONT_A) && !KEY_JMP)
		{
			vsp = -3
			jumping = false
		}
	
		if place_meeting(x + hsp,y,obj_solid) && abs(hsp) > 4
		{
			play_sfx(choose(sfx_hitwall1,sfx_hitwall2,sfx_hitwall3),false)
			x -= hsp
			hsp *= -0.75
		}
	}
}
else
	hsp = lerp(hsp,0,0.2)

if abs(hsp) > 10
	instance_create_depth(x,y,depth + 1,obj_trail)
	
if grounded && abs(hsp) > 2
{
	runtimer++
	if runtimer > 17 - abs(hsp)
	{
		runtimer = 0
		if soundpick = sfx_run1
			soundpick = sfx_run2
		else
			soundpick = sfx_run1
		
		play_sfx(soundpick,false)
	}
}
else
	runtimer = 99

#region up arrow
if place_meeting(x,y,obj_npc) && controllable
{
	arrowoff = lerp(arrowoff,0,0.1)
	arrowalph = lerp(arrowalph,1,0.2)
}
else
{
	arrowoff = lerp(arrowoff,-45,0.1)
	arrowalph = lerp(arrowalph,0,0.2)
}
arrowbob = sin(time / 30) * 5
arrowframetime++
if arrowframetime >= 30 //2 fps
{
	arrowframetime = 0
	arrowframe++
	if arrowframe > 1
		arrowframe = 0
}
#endregion
