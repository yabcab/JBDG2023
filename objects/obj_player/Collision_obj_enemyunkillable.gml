if state = states.normal
{
	anim_hurt = true
	y -= 11
	play_sfx(sfx_redhit)
	//instance_destroy(other)
	other.hitting = true
	other.alarm[0] = 50
	var dir = point_direction(other.x,other.y,x,y)
	var sp = 20
	hsp = lengthdir_x(sp,dir)
	vsp = lengthdir_y(sp,dir)
}
else if state = states.rocket
{
	points += 175
	instance_destroy(other)
	play_sfx(sfx_egghit)
	with instance_create_depth(other.x,other.y,-1,obj_eggparticle)
	{
		sprite_index = spr_enemyangry_dead
		hspeed = (obj_player.hsp * 2) + random_range(-2,2)
		vspeed = random_range(-8,-12)
	}
}
else if state = states.golf
{
	play_sfx(sfx_redhit)
	y -= 5
	other.hitting = true
	other.alarm[0] = 50
	var dir = point_direction(other.x,other.y,x,y)
	var sp = 20
	hsp = lengthdir_x(sp,dir)
	vsp = lengthdir_y(sp,dir)
}