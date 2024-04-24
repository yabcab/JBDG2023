function load_save()
{
	//to reload, just call this again
	max_completed_level = 0
	
	ini_open("save.ini")
	for (var i = 1; i < 100; i++)
	{
		level_completion[i] = ini_read_real("level_completion",i,false)
		if level_completion[i] = true
			max_completed_level = i
	}
	ini_close()
}

function save_level_completion(level)
{
	ini_open("save.ini")
	ini_write_real("level_completion",level,true)
	ini_close()
}

function clear_completed_levels()
{
	ini_open("save.ini")
	for (var i = 1; i < 100; i++)
		ini_write_real("level_completion",level,false)
	ini_close()
}