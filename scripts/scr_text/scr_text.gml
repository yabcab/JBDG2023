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
				text = "GOOD BOY LITTLE SCRIPT."
		}
		break;
		
		case "@START_RAIN":
		{
			instance_destroy(inst_17DF170A)// this one specifically
			
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
		
		case "@SUMMON_MEATBABY":
		{
			var yy = obj_player.y - 300
			var xx = obj_player.x
			instance_create_depth(xx,yy,-1,obj_meatbaby)
			repeat 40
				instance_create_depth(xx,yy,-1,obj_whiteparticle)
		}
		break;
		
		case "@MOVE_UP":
		{
			vspeed = -3
			alarm[1] = 300
		}
		break;
		
		case "@DUNKMEAT_TITLE":
		{
			glue_overlay(spr_dunkthebaby)
		}
		break;
		
		case "@EXPLODE_AND_DIE":
		{
			idlespr = spr_empty
			talkspr = spr_empty
			with instance_create_depth(x,y,depth,obj_smokepuff)
				sprite_index = spr_explosion
			//sound here
			instance_create_depth(x,y,101,obj_risinggrave)
			x = -1000
			y = -1000
		}
		break;
		
		case "@FADE_OUT":
		{
			fadeaway = true	
		}
		break;
		
		case "@BINGLE_ACTIVITY":
		{
			with obj_bingle
				alarm[0] = 1
		}
		break;
		
		case "@KILL_JAYLA": // whoops! murder!
		{
			with obj_player // same as collision with obj_spikes
			{
				deaths++
				state = states.normal
				vsp = -7
				broimdead = true
				deadtimer = 60
				state = states.normal
				audio_stop_sound(sfx_getrocket)
				instance_create_depth(x,y,-100,obj_rescuebubble)
		
				play_sfx(sfx_bubblehit)
			}
		}
		break;
		
		case "@BECOME_THINGY":
		{
			npcid = npcs.badfather
			talkspr = spr_father_talk
			idlespr = spr_father_idle
			drawnbg = spr_textbg_father
			
			max_texts = 0
			text[0] = "I lost my son. Where is he?"
		}
		break;
		
		case "@SHOW_THE_IMAGE":
		{
			glue_overlay(spr_updogimage)
		}
		break;
	}
	
	if string_copy(text[text_selected],1,1) = "@"
		return true;
	else
		return false;
}