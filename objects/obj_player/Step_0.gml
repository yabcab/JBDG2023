var axdir = gamepad_axis_value(0,gp_axislh)
var axisv = gamepad_axis_value(0,gp_axislv)
if KEY_D
	axisv = 1

if axisv <= 0
	alreadypounded = false

time++
if grounded
{
	hasdoublejump = true
	anim_hurt = false	
	anim_egg = false
}

switch state
{
	case states.normal:
	{
		image_speed = 1
		if grounded
		{
			if abs(axdir) > 0 || KEY_L || KEY_R
			{
				sprite_index = spr_playerJ_move
				image_speed = abs(hsp) / 3
			}
			else
				if axisv > 0.1
					sprite_index = spr_playerJ_crouch
				else
					sprite_index = spr_playerJ_idle
		}
		else
		{
			if anim_hurt
				sprite_index = spr_playerJ_pain
			else if anim_jump
				sprite_index = spr_playerJ_jump
			else if anim_egg
				sprite_index = spr_playerJ_egg
			else
				sprite_index = spr_playerJ_air
		}
		
		//STROMBULOUS
		if levelcomplete
		{
			sprite_index = spr_playerJ_air
			instance_create_depth(x,bbox_bottom + yoff,depth - 1,obj_whiteparticle)	
		}
		
		if abs(hsp) > 10
			instance_create_depth(x,y,depth + 1,obj_trail)
		
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
				if abs(axdir) > 0
					hsp = approach(hsp,(walksp + (holdrun * runsp)) * axdir,0.3)
				else
					hsp = approach(hsp,0,0.5)
	
				if (grounded || place_meeting(x,y,obj_airjump) || place_meeting(x,y + 20,obj_solid)) && (gamepad_button_check_pressed(0,CONT_A) || KEY_JMP_P)
				{
					play_sfx(sfx_jump)
					vsp = -15
					jumping = true
					hasdoublejump = true
					anim_jump = true
					image_index = 0
					
					if place_meeting(x,y,obj_airjump)
					{
						with instance_nearest(x,y,obj_airjump)
						{
							image_xscale = 1.6
							image_yscale = 1.6
							repeat 15
								with instance_create_depth(x,y,depth - 1,obj_whiteparticle)
								{
									image_angle = point_direction(0,0,hspeed,vspeed)
									sprite_index = spr_bubbleline
									alphlower = random_range(0.07,0.09)
									starth = abs(hspeed / 50)
									startv = abs(vspeed / 50)
								}
						}
					}
				}
				else if hasdoublejump && can_doublejump && (gamepad_button_check_pressed(0,CONT_A) || KEY_JMP_P)
				{
					repeat 15
						with instance_create_depth(x,y,depth,obj_whiteparticle)
							vspeed = random_range(3,5)
					play_sfx(sfx_jump)
					vsp = -15
					jumping = true
					hasdoublejump = false
					anim_jump = true
					image_index = 0
					anim_hurt = false
					anim_egg = false
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
					if grounded
						vsp = -3
					if !place_meeting(x,y - 11,obj_solid)
						y -= 11
					anim_hurt = true
					anim_egg = false
				}
		
				if can_egg
				{
					if (gamepad_button_check_pressed(0,CONT_X) || KEY_EGG_P) && instance_number(obj_eggprojectile) < 5
					{
						play_sfx(sfx_eggtoss)
						anim_egg = true
						anim_hurt = false
						
						var dir = 1
						if axdir < 0
							dir = -1
						if axdir = 0
							dir = facing
					
						with instance_create_depth(x,y,depth + 1,obj_eggprojectile)
							hspeed = (20 * dir)
							
						if grounded
						{
							vsp = -5
							if !place_meeting(x,y - 11,obj_solid)
								y -= 11
						}
					}
				}
				
				if can_groundpound
				{
					if axisv > 0.5 && !grounded && !alreadypounded
					{
						vsp = -4
						state = states.groundpound
					}
				}
			}
		}
		else if !broimdead
			hsp = lerp(hsp,0,0.2)
			
		if broimdead
		{
			sprite_index = spr_playerJ_pain
			hsp = lerp(hsp,0,0.05)
			vsp = lerp(vsp,0,0.05)
			deadtimer = approach(deadtimer,-1,1)
			if deadtimer <= 0
			{
				if deadtimer > -1 && !audio_is_playing(sfx_bubblemove)
					play_sfx(sfx_bubblemove)
				hsp = 0
				vsp = 0
				x = lerp(x,checkpointx,0.035)
				y = lerp(y,checkpointy - 100,0.035) 
		
				if distance_to_point(checkpointx,checkpointy - 100) < 10
				{
					broimdead = false
					play_sfx(sfx_bubblepop)	
				}
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
		image_speed = 1
		sprite_index = spr_playerJ_rocket
		var c = choose(0,1)
		if c
			instance_create_depth(x + (4 * facing),y - 20,-2,obj_confetti) // i hope this does not kill performance :p
		
		if abs(hsp) > 10
			instance_create_depth(x,y,depth + 1,obj_trail)
		
		if KEY_U
			axisv = -1
		if KEY_D	
			axisv = 1
		
		hsp = approach(hsp,11 * facing,0.6)
		vsp = approach(vsp,axisv * 5,0.5)
		
		if place_meeting(x + hsp,y,obj_solid)
		{
			anim_jump = false
			anim_hurt = true
			audio_stop_sound(sfx_getrocket)
			x -= hsp
			state = states.normal
			vsp = -4
			hsp = -20 * facing
			play_sfx(sfx_explode)
			with instance_create_depth(x + (4 * facing),y - 20,-2,obj_killedrocket)
				image_xscale = other.facing
			// the xbox will NOT like this one (i dont care!) - originally 150
			repeat 75
				instance_create_depth(random_range(x - 20,x + 20),random_range(y - 20,y + 20),-2,obj_confetti) 
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
		
		//thou shalt not egg any longer
		//if can_egg
		//{
		//	if (gamepad_button_check_pressed(0,CONT_X) || KEY_EGG_P) && instance_number(obj_eggprojectile) < 5
		//	{
		//		play_sfx(sfx_eggtoss)
				
		//		var dir = 1
		//		if axdir < 0
		//			dir = -1
		//		if axdir = 0
		//			dir = facing
					
		//		with instance_create_depth(x,y,depth + 1,obj_eggprojectile)
		//			hspeed = (20 * dir)
		//	}
		//}
		hasdoublejump = true
	}
	break;
	
	case states.golf:
	{
		rot -= hsp
		if rot > 360
			rot -= 360
		if rot < -360
			rot += 360
			
		if abs(hsp) > 10 || abs(vsp) > 10
			with instance_create_depth(x,y,depth + 1,obj_trail)
				image_angle = other.rot
		
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
			
			drawray = true
		}
		else
		{
			drawray = false
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
			if !place_meeting(x,y - vsp,obj_solid)
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
	break;
	
	case states.groundpound:
	{
		alreadypounded = true
		hsp = approach(hsp,3 * sign(axdir),0.25)
		vsp = approach(vsp,20,0.7)
		
		if grounded
		{
			y -= 11
			vsp = -5
			state = states.normal
		}
	}
	break;
	
	case states.floured:
	{
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
				hsp = approach(hsp,10 * facing,0.25)
	
				if (grounded || place_meeting(x,y,obj_airjump) || place_meeting(x,y + 20,obj_solid)) && (gamepad_button_check_pressed(0,CONT_A) || KEY_JMP_P)
				{
					play_sfx(sfx_jump)
					vsp = -15
					jumping = true
					hasdoublejump = true
					anim_jump = true
					image_index = 0
					
					if place_meeting(x,y,obj_airjump)
					{
						with instance_nearest(x,y,obj_airjump)
						{
							image_xscale = 1.6
							image_yscale = 1.6
							repeat 15
								with instance_create_depth(x,y,depth - 1,obj_whiteparticle)
								{
									image_angle = point_direction(0,0,hspeed,vspeed)
									sprite_index = spr_bubbleline
									alphlower = random_range(0.07,0.09)
									starth = abs(hspeed / 50)
									startv = abs(vspeed / 50)
								}
						}
					}
				}
				else if hasdoublejump && can_doublejump && (gamepad_button_check_pressed(0,CONT_A) || KEY_JMP_P)
				{
					repeat 15
						with instance_create_depth(x,y,depth,obj_whiteparticle)
							vspeed = random_range(3,5)
					play_sfx(sfx_jump)
					vsp = -15
					jumping = true
					hasdoublejump = false
					anim_jump = true
					image_index = 0
					anim_hurt = false
					anim_egg = false
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
					facing *= -1
					if grounded
						vsp = -3
					if !place_meeting(x,y - 11,obj_solid)
						y -= 11
					anim_hurt = true
					anim_egg = false
				}
			}
		}
	}
	break;
}

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

if talking // to the right of npc when talking
{
	sprite_index = spr_playerJ_idle
	
	var i = instance_nearest(x,y,obj_npc)
	
	hsp = 0
	x = lerp(x,i.x + 50,0.1)
	facing = -1
}