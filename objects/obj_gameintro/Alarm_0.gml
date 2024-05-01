fadestate = 1
set1 = false
if !audio_is_playing(titlemusic)
{
	titlemusic = audio_play_sound(mu_title,1,true)
	if skip_loading
		audio_sound_set_track_position(titlemusic,9)
	else
		audio_sound_set_track_position(titlemusic,8.5)
	audio_sound_gain(mu_title,0,0)
}