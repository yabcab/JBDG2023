for (var i = 0; i <= active_slot_count; i++)
{
	//swap music check
	if playing_index[i] != target_index[i]
	{
		audio_stop_sound(playing_id[i])
		playing_id[i] = audio_play_sound(target_index[i],true,1) //audio_play_sound_on(music_bus,target_index[i],true,1)
		playing_index[i] = target_index[i]
	}
	
	//quiet non-active slots
	//if prevslot != slot_active
	//{
		if slot_active = i
			audio_sound_gain(playing_id[i],f_vol[i],f_fadeintime[i])
		else
			audio_sound_gain(playing_id[i],f_absentvol[i],f_fadeouttime[i])
	//}
}

if prevslot != slot_active
	prevslot = slot_active