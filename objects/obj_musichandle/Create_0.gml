#macro MAX_MUSIC_SLOTS 10

active_slot_count = 3
prevslot = 0

playing_id = []
playing_index = []
target_index = []
slot_active = 1

//set with funcs
f_fadeintime = []
f_fadeouttime = []
f_vol = []
f_absentvol = []

for (var i = 0; i < MAX_MUSIC_SLOTS; i++)
{
	playing_id[i] = noone
	playing_index[i] = noone
	target_index[i] = noone
	
	f_fadeintime[i] = 0
	f_fadeouttime[i] = 0
	f_vol[i] = 1
	f_absentvol[i] = 0
}