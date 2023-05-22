play_sfx(sfx_egghit)
instance_destroy(other)
instance_destroy()
points += 125
with instance_create_depth(other.x,other.y,-1,obj_eggparticle)
{
	sprite_index = spr_enemy_dead
	hspeed = other.hspeed
	vspeed = random_range(-8,-12)
}