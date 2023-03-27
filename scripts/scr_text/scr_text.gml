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
		
		case "@START_RAIN":
		{
			if !audio_is_playing(sfx_rainloop1)
			{
				audio_play_sound(sfx_rainloop1,1,true)
				audio_play_sound(sfx_rainloop2,1,true)
				audio_play_sound(sfx_rainloop3,1,true)
			}
			audio_pause_sound(mu_introtutorial)
			
			var bgl = layer_get_id("Background")
			var bgi = layer_background_get_id(bgl)
			layer_background_blend(bgi,make_color_rgb(53,53,62))
			
			layer_set_visible(layer_get_id("Backgrounds_raindark"),true)
			
			with obj_parallax
				visible = true
		}
		break;
	}
	
	if string_copy(text[text_selected],1,1) = "@"
		return true;
	else
		return false;
}