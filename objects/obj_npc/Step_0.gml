var text_wrap_width = 825

if speaking
{
	if text_checker()
	{
		if text_selected < max_texts
		{
			textcopy = ""
			text_spot = 1
			text_selected++
		}
		else
		{
			speaking = false
			textbox_show = false
			text_selected = 0
			textcopy = ""
			textcopy_timer = 0
			text_spot = 1

			controllable = true
			obj_player.talking = false
		}
	}
	textbox_yoff = lerp(textbox_yoff,0,0.2)
	textcopy_timer--
	if textcopy_timer <= 0 && text_spot < string_length(text[text_selected]) + 1
	{
		textcopy_timer = 2
		textcopy += string_copy(text[text_selected],text_spot,1)
		var textlinestart = 0
		while string_pos_ext("\n",textcopy,textlinestart)
			textlinestart = string_pos_ext("\n",textcopy,textlinestart) + 1
		if string_width(string_copy(textcopy,textlinestart,999)) > text_wrap_width && string_copy(text[text_selected],text_spot,1) = " "
			textcopy += "\n"
		text_spot++
	}
	
	if gamepad_button_check_pressed(0,CONT_A) || KEY_JMP_P
	{
		if text_spot >= string_length(text[text_selected]) + 1
		{
			if text_selected < max_texts
			{
				textcopy = ""
				text_spot = 1
				text_selected++
			}
			else
			{
				speaking = false
				textbox_show = false
				text_selected = 0
				textcopy = ""
				textcopy_timer = 0
				text_spot = 1

				controllable = true
				obj_player.talking = false
			}
		}
		else
		{
			textcopy = ""
			for (text_spot = 1; text_spot < string_length(text[text_selected]) + 1; text_spot++)
			{
				textcopy += string_copy(text[text_selected],text_spot,1)
				var textlinestart = 0
				while string_pos_ext("\n",textcopy,textlinestart)
					textlinestart = string_pos_ext("\n",textcopy,textlinestart) + 1
				if string_width(string_copy(textcopy,textlinestart,999)) > text_wrap_width && string_copy(text[text_selected],text_spot,1) = " "
					textcopy += "\n"
			}
		}
	}
}
else
{
	textbox_yoff = lerp(textbox_yoff,150,0.2)
	if place_meeting(x,y,obj_player) && (gamepad_axis_value(0,gp_axislv) < -0.2 || keyboard_check(vk_up)) && !speaking
	{
		speaking = true
		speechbubble = false
		textbox_show = true
		
		with obj_player
		{
			controllable = false
			talking = true
		}
	}
}

//if !speechbubble && instance_exists(my_speechbubble)
//	my_speechbubble.exiting = true
	
xscroll -= 0.5
yscroll -= 0.5
if xscroll < -sprite_get_width(drawnbg)
	xscroll += sprite_get_width(drawnbg)
if yscroll < -sprite_get_height(drawnbg)
	yscroll += sprite_get_height(drawnbg)
	
if speaking
	sprite_index = talkspr
else
	sprite_index = idlespr