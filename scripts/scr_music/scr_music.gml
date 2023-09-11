function new_music(sound){
	show_debug_message("new_music() is DEAD - please remove or replace this.")
	return noone	
	//if musictarget != sound
	//  {
	//    musictarget = sound
	//    audio_stop_sound(playingmusic)
	//   playingmusic = audio_play_sound(sound,1,true)
  //}
}

function music_set_slot_count(slots)
{
	with obj_musichandle
	{
		if slots > MAX_MUSIC_SLOTS
		{
			active_slot_count = MAX_MUSIC_SLOTS
			show_debug_message("Attempting to use too many music slots - Max is " + string(MAX_MUSIC_SLOTS) + ".")
		}
		else
		{
			active_slot_count = slots
			for (var i = slots + 1; i < MAX_MUSIC_SLOTS; i++)
			{
				audio_stop_sound(playing_id[i])
				target_index[i] = noone	
				playing_index[i] = noone	
				playing_id[i] = noone	
			}
		}
	}
}

function music_set_active_slot(slot)
{
	with obj_musichandle
	{
		//f_absentvol[slot_active] = 0
		if slot > active_slot_count && slot != noone
			show_debug_message("Cannot set slot this high.")
		else
			slot_active = slot
	}
}

function music_get_active_slot()
{
	return obj_musichandle.slot_active	
}

function music_set_slot_target(slot,sound)
{
	with obj_musichandle
	{
		if slot > active_slot_count
			show_debug_message("Cannot set slot this high.")
		else if audio_exists(sound)
		{
			target_index[slot] = sound
		}
		else
			show_debug_message("Sound does not exist! - Tried using " + string(sound))
	}
}

function music_get_slot_target(slot)
{
	with obj_musichandle
	{
		if slot < active_slot_count
		{
			return target_index[slot]
		}
		else
			show_debug_message("Cannot fetch from slot this high!")
	}
}

function music_restart_slot(slot)
{
	with obj_musichandle
	{
		if slot > active_slot_count
			show_debug_message("Cannot restart slot this high.")
		else
		{
			var v = f_vol[slot]
			if slot_active != slot
				v = f_absentvol[slot]
			
			audio_stop_sound(playing_id[slot])
			playing_id[slot] = audio_play_sound(target_index[slot],1,true,v)
		}
	}
}

function music_set_active_volume(slot,vol)
{
	with obj_musichandle
	{
		if slot > active_slot_count
			show_debug_message("Cannot set volume on slot this high.")
		else
		{
			f_vol[slot] = vol
		}
	}
}

function music_set_inactive_volume(slot,vol)
{
	with obj_musichandle
	{
		if slot > active_slot_count
			show_debug_message("Cannot set volume on slot this high.")
		else
		{
			f_absentvol[slot] = vol
		}
	}
}

function music_set_slot_fadeintime(slot,time)
{
	with obj_musichandle
	{
		if slot > active_slot_count
			show_debug_message("Cannot set fadein time on slot this high.")
		else
			f_fadeintime[slot] = time
			
	}
}

function music_set_slot_fadeouttime(slot,time)
{
	with obj_musichandle
	{
		if slot > active_slot_count
			show_debug_message("Cannot set fadeout time on slot this high.")
		else
			f_fadeouttime[slot] = time
			
	}
}