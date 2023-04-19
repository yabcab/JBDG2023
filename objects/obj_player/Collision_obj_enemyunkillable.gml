if state = states.normal
{
	y -= 5
	//instance_destroy(other)
	var dir = point_direction(other.x,other.y,x,y)
	var sp = 20
	hsp = lengthdir_x(sp,dir)
	vsp = lengthdir_y(sp,dir)
}
else if state = states.rocket
{
	instance_destroy(other)
	with instance_create_depth(other.x,other.y,-1,obj_eggparticle)
	{
		sprite_index = spr_enemyplaceholder
		hspeed = other.hspeed
		vspeed = random_range(-8,-12)
	}
}