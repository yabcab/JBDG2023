if drawray
{
	//init ray
	var x_new, y_new, x_old, y_old, x_vel, y_vel, init_spd, previously_walled, pset
	init_spd = 20
	x_vel = 0
	y_vel = 0
	previously_walled = false
	pset = false
	
	//grab coords
	x_old = x
	y_old = y
	x_new = x_old
	y_new = y_old
	
	//grab velocity
	var dir = point_direction(x,y,mouse_x,mouse_y)
	x_vel = lengthdir_x(init_spd,dir)
	y_vel = lengthdir_y(init_spd,dir)
	
	while !previously_walled
	{
		//move new coords
		x_new = x_old + x_vel
		y_new = y_old + y_vel
		y_vel = approach(y_vel,18,0.5)
		
		//draw connection
		draw_line(x_old,y_old,x_new,y_new)
		
		//set old coords
		x_old = x_new
		y_old = y_new
		
		//wall check
		if pset
			previously_walled = true
		// todo fix plat collision check
		if position_meeting(x_new,y_new,obj_platform)
		{
			var p = instance_position(x_new,y_new,obj_platform)
			if y_new < p.y
				pset = true
		}
		else
			pset = position_meeting(x_new,y_new,obj_solid)
	}
}

draw_sprite_ext(sprite_index,image_index,x,y + yoff,image_xscale * facing,image_yscale,rot,image_blend,image_alpha)
draw_sprite_ext(spr_npcarrow,arrowframe,x,y - 75 + arrowoff + arrowbob,1,1,0,c_white,arrowalph)
//draw_text(x - 20,y - 20,string(hasdoublejump))
