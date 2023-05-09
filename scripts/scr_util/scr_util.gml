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

function make_shadow_layer_do_shadow()
{
	var l = layer_get_id("Tiles_s")
	var t = layer_tilemap_get_id(l)
}