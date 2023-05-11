function approach(val1,val2,inc)
{
	return argument0 + clamp(argument1 - argument0, -argument2, argument2)
}

function play_sfx(sound,do_pitch = true,pitch_low = 0.8,pitch_high = 1.2)
{
	var s = audio_play_sound(sound,0,false)
	if do_pitch
		audio_sound_pitch(s,random_range(pitch_low,pitch_high))
	return s
}

function make_shadow()
{
	//init req'd vars
	yoff = 0
	rot = 0
	facing = 1
	bobsin = 0
	
	//make it
	with instance_create_depth(0,0,101,obj_shadow)
		assigned = other.id
}