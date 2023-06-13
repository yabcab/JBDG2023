can_egg = true

if !other.levelcomplete
{
	followplayer = true
	play_sfx(sfx_gotitem,false)
	repeat 25
		instance_create_depth(x,y,depth,obj_whiteparticle)
	alarm[0] = 75
	with other
		levelcomplete = true
}