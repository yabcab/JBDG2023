var h = hspeed
with other
{
	repeat 10
		with instance_create_depth(x + 32,y + 32,-1,obj_cratepart)
		{
			hspeed = (h / 3) + random_range(-2,2)
			vspeed = random_range(-6,-3)
		}
}

instance_destroy(other)
instance_destroy()
play_sfx(sfx_cratehit)