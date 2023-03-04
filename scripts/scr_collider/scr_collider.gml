function collider_step()
{
	
	grounded = false
	if place_meeting(x,y + 5,obj_solid)
		grounded = true
	
	if place_meeting(x,y,obj_slope) && !jumping
	{
		grounded = true
		vsp = 0
		while place_meeting(x,y,obj_slope)
			y -= 0.1
	}
	if place_meeting(x,y + abs(hsp) + 3,obj_slope) && !jumping
	{
		grounded = true
		vsp = 0
		while place_meeting(x,y + abs(hsp) + 3,obj_slope) && !place_meeting(x,y,obj_slope)
			y += 0.1
	}
	
	if place_meeting(x + hsp,y,obj_solid)
	{
		if !place_meeting(x + hsp,y - 20,obj_solid)
		{
			while place_meeting(x + hsp,y,obj_solid)
				y--
			x += hsp
		}
		else
		{
			while !place_meeting(x + sign(hsp),y,obj_solid) && hsp != 0
				x += sign(hsp)
			hsp = 0
		}
	}
	else if place_meeting(x + hsp,y,obj_enemysolid) && use_enemysolids
	{
		if !place_meeting(x + hsp,y - 20,obj_solid)
		{
			while place_meeting(x + hsp,y,obj_solid)
				y--
			x += hsp
		}
		else
		{
			while !place_meeting(x + sign(hsp),y,obj_solid) && hsp != 0
				x += sign(hsp)
			hsp = 0
		}
	}
	else x += hsp
	
	if place_meeting(x,y + vsp,obj_solid)
	{
		if place_meeting(x,y + abs(vsp),obj_solid)
			grounded = true
		while !place_meeting(x,y + sign(vsp),obj_solid) && vsp != 0
			y += sign(vsp)
		vsp = 0
	}	
	else if place_meeting(x,y + vsp,obj_platform) && !place_meeting(x,y,obj_platform) && vsp >=0
	{
		grounded = true
		vsp = 0
		while !place_meeting(x,y + 1,obj_platform)
			y++
	}
	else y += vsp
	
	//if grounded
	//	jumping = false
}	

function collider_init()
{
	use_enemysolids = false
	grounded = false
	hsp = 0
	vsp = 0
	grav = 0
	jumping = false
}