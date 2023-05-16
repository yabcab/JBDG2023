instance_destroy()
audio_stop_sound(sfx_collect1)
audio_stop_sound(sfx_collect2)
play_sfx(choose(sfx_collect1,sfx_collect2))
repeat 5
	instance_create_depth(x + 16,y + 16,depth,obj_whiteparticle)