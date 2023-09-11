function collider_step()
{
	if ignore_collides
	{
		x += hsp
		y += vsp
	}
	else
	{
		//var j = abs(vsp) > abs(hsp) && vsp < 0
	
		grounded = false
		if place_meeting(x,y + 1,obj_solid)
			grounded = true
		
		#region slopes
		var nearslope = instance_nearest(x,y,obj_slope)
		if instance_exists(nearslope)
		{
			if sign(nearslope.image_yscale) = 1
			{
				if place_meeting(x,y,obj_slope)
				{
					previousframe_sloped = true
					if vsp >= 0
					{
						grounded = true
						vsp = 0
					}
					while place_meeting(x,y,obj_slope)
						y -= 0.1
				}
				if place_meeting(x,y + abs(hsp) + 3,obj_slope) && vsp >= 0
				{
					previousframe_sloped = true
					grounded = true
					vsp = 0
					while place_meeting(x,y + abs(hsp) + 3,obj_slope) && !place_meeting(x,y,obj_slope)
						y += 0.1
				}
				if previousframe_sloped
				{
					if place_meeting(x,y + abs(hsp) + 3,obj_solid) && vsp >= 0
					{
						previousframe_sloped = true
						grounded = true
						vsp = 0
						while place_meeting(x,y + abs(hsp) + 3,obj_solid) && !place_meeting(x,y,obj_solid)
							y += 0.1
					}
					else
						previousframe_sloped = false
				}
			}
			else
			{
				if place_meeting(x,y,obj_slope)
				{
					while place_meeting(x,y,obj_slope)
						y++
					if vsp <= 0
						vsp = 0
				}
			}
		}
		#endregion
	
		#region solids + movement
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
		#endregion
		
		#region solid snap + platforms
		if place_meeting(x,y + vsp,obj_solid)
		{
			if place_meeting(x,y + abs(vsp),obj_solid)
				grounded = true
			while !place_meeting(x,y + sign(vsp),obj_solid) && vsp != 0
				y += sign(vsp)
			vsp = 0
		}	
		else if place_meeting(x,ceil(y) + vsp,obj_platform) && !place_meeting(x,y - 1,obj_platform) && vsp >=0
		{
			grounded = true
			vsp = 0
			while !place_meeting(x,y + 1,obj_platform)
				y++
		}
		else y += vsp
		#endregion
	}
}	

function collider_init()
{
	use_enemysolids = false
	grounded = false
	hsp = 0
	vsp = 0
	grav = 0
	jumping = false
	broimdead = false
}