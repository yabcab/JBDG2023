var axdir = gamepad_axis_value(0,gp_axislh)
var axisv = gamepad_axis_value(0,gp_axislv)

time++
if grounded
	hasdoublejump = true

switch state
{
	case states.normal:
	{
		if !broimdead
			vsp = approach(vsp,18,0.5)
		
		if controllable && !broimdead
		{
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
				yoffspeed += 0.175 // too lazy to cap the speed :p
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
					hasdoublejump = true
				}
				else if hasdoublejump && can_doublejump && (gamepad_button_check_pressed(0,CONT_A) || KEY_JMP_P)
				{
					play_sfx(sfx_jump)
					vsp = -15
					jumping = true
					hasdoublejump = false
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
		
				if can_egg
				{
					if (gamepad_button_check_pressed(0,CONT_X) || KEY_EGG_P) && instance_number(obj_eggprojectile) < 5
					{
						var dir = 1
						if axdir < 0
							dir = -1
						if axdir = 0
							dir = facing
					
						with instance_create_depth(x,y,depth + 1,obj_eggprojectile)
							hspeed = (20 * dir)
					}
				}
			}
		}
		else if !broimdead
			hsp = lerp(hsp,0,0.2)
		else
		{
			hsp = lerp(hsp,0,0.05)
			vsp = lerp(vsp,0,0.05)
			deadtimer = approach(deadtimer,0,1)
			if deadtimer <= 0
			{
				x = lerp(x,checkpointx,0.035)
				y = lerp(y,checkpointy - 100,0.035)
		
				if distance_to_point(checkpointx,checkpointy - 100) < 5
					broimdead = false
			}
		}
		
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
	}
	break;
	
	case states.rocket:
	{
		if KEY_U
			axisv = -1
		if KEY_D	
			axisv = 1
		
		hsp = approach(hsp,11 * facing,0.6)
		vsp = approach(vsp,axisv * 5,0.5)
		
		if place_meeting(x + hsp,y,obj_solid)
		{
			x -= hsp
			state = states.normal
			vsp = -4
			hsp = -20 * facing
		}
		
		//possibly unused thing
		//if gamepad_button_check_pressed(0,CONT_A) || KEY_JMP_P
		//{
		//	state = states.normal
		//	play_sfx(sfx_jump)
		//	vsp = -15
		//	jumping = true
		//	hasdoublejump = true
		//}
		
		if can_egg
		{
			if (gamepad_button_check_pressed(0,CONT_X) || KEY_EGG_P) && instance_number(obj_eggprojectile) < 5
			{
				var dir = 1
				if axdir < 0
					dir = -1
				if axdir = 0
					dir = facing
					
				with instance_create_depth(x,y,depth + 1,obj_eggprojectile)
					hspeed = (20 * dir)
			}
		}
		hasdoublejump = true
	}
	break;
	
	case states.golf:
	{
		if cangolf
		{
			if mouse_check_button_pressed(mb_left)
			{
				var sp = 30
				var dir = point_direction(x,y,mouse_x,mouse_y)
				var h = lengthdir_x(sp,dir)
				var v = lengthdir_y(sp,dir)
				
				hsp = h
				vsp = v
				cangolf = false
			}
		}
		else
		{
			if abs(vsp) < 0.5 && abs(hsp) < 0.5
			{
				cangolf = true
				hsp = 0
				vsp = 0
			}
		}
		
		if !broimdead
			vsp = approach(vsp,18,0.5)
		
		if place_meeting(x,y + vsp,obj_solid) && (abs(vsp) > 7 || (abs(hsp) > 8 && abs(vsp) > 3))
		{
			y -= vsp
			vsp *= -0.6
			hsp /= 1.05
		}
		if place_meeting(x + hsp,y,obj_solid) && abs(hsp) > 3
		{
			x -= hsp
			hsp *= -0.6
		}
		
		if grounded
		{
			hsp = approach(hsp,0,0.15)
		}
	}
}


if abs(hsp) > 10
	instance_create_depth(x,y,depth + 1,obj_trail)

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