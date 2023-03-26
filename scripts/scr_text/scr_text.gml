function text_checker()
{
	switch text[text_selected]
	{
		//old system remains
		case "@TUTORIAL_BECOMEPLAT":
		{
			//obj_player.state = playerstate.plat
			//instance_destroy(jobwall[3])
			//textcopy = ""
			//text_spot = 1
			//text_selected++
			//audio_stop_sound(mu_tutorial)
			//if !audio_is_playing(mu_tutorial_b)
			//	audio_play_sound(mu_tutorial_b,1,1)
		}
		break;
		
		case "@TEST":
		{
			with instance_create_depth(x,y,0,obj_roomname)
				text = "The test was a success!"
		}
		break;
	}
	
	if string_copy(text[text_selected],1,1) = "@"
		return true;
	else
		return false;
}