globalvar controllable; controllable = true // make me false when its time!
pal_swap_init_system(shd_pals)

//game font
var fontstr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&*()_+1234567890-=[]\\{}|;':\",./<>?`~♡☺♢♤♧ⒶⒷⓍⓎ"
var sep = 0
globalvar fnt_game_boil1; fnt_game_boil1 = font_add_sprite_ext(spr_gamefont_boil1,fontstr,2,sep)
globalvar fnt_game_boil2; fnt_game_boil2 = font_add_sprite_ext(spr_gamefont_boil1,fontstr,2,sep)
globalvar fnt_game; fnt_game = fnt_game_boil1
globalvar global_transition_surface; global_transition_surface = 0
draw_set_font(fnt_game)

globalvar can_egg; can_egg = false
globalvar can_doublejump; can_doublejump = false
globalvar can_groundpound; can_groundpound = false
globalvar deaths; deaths = 0
globalvar coins; coins = 0
globalvar points; points = 0
globalvar skip_loading; skip_loading = false
globalvar version; version = "1.0.devagain"

room_goto(rm_intro6)

if os_type = os_windows
	window_set_size(1920,1080)

//show_debug_overlay(true)

//for when i have music playing
//audio_group_set_gain(audiogroup_default,0,0) 

#macro CONT_A gp_face1
#macro CONT_X gp_face3
#macro CONT_RB gp_shoulderrb
#macro CONT_RT gp_shoulderr
#macro CONT_LB gp_shoulderlb
#macro CONT_LT gp_shoulderl

//NOTE - keyboard support comes SECOND. 
//you are building Trails and Tribulations primarily to be run on XBOX UWP WITH A CONTROLLER!!
//bitch
#macro KEY_L keyboard_check(vk_left)
#macro KEY_L_P keyboard_check_pressed(vk_left)
#macro KEY_R keyboard_check(vk_right)
#macro KEY_R_P keyboard_check_pressed(vk_right)
#macro KEY_U keyboard_check(vk_up)
#macro KEY_U_P keyboard_check_pressed(vk_up)
#macro KEY_D keyboard_check(vk_down)
#macro KEY_D_P keyboard_check_pressed(vk_down)
#macro KEY_JMP keyboard_check(ord("Z"))
#macro KEY_JMP_P keyboard_check_pressed(ord("Z"))
#macro KEY_EGG_P keyboard_check_pressed(ord("X"))

globalvar level_completion; level_completion = []
globalvar max_completed_level; max_completed_level = 0
globalvar level_id; level_id = -1
load_save()

globalvar level_names; level_names = []
globalvar level_rooms; level_rooms = []
var l = 1

#region world 1
level_names[l] = "1-1 - Welcome"
level_rooms[l] = rm_intro
l++
level_names[l] = "1-2 - Head Smashing"
level_rooms[l] = rm_intro2
l++
level_names[l] = "1-3 - Bubby Bubbles"
level_rooms[l] = rm_intro3
l++
level_names[l] = "1-4 - Bubbles With Sharp Things"
level_rooms[l] = rm_intro4
l++
level_names[l] = "1-5 - The Great Ascent"
level_rooms[l] = rm_intro5
l++
level_names[l] = "1-6 - Careful Droppings"
level_rooms[l] = rm_intro6
l++
#endregion

#region world 2
level_names[l] = "2-1 - Into to Scrambled Eggs"
level_rooms[l] = rm_egg1
l++
level_names[l] = "2-2 - NAME"
level_rooms[l] = rm_intro // TODO MAKE LEVEL
l++
level_names[l] = "2-3 - Meat Baby's Curse"
level_rooms[l] = rm_egg2
l++
level_names[l] = "2-4 - The Unstoppable Red Guy"
level_rooms[l] = rm_egg3
l++
level_names[l] = "2-5 - Bingle Time"
level_rooms[l] = rm_egg4
l++
level_names[l] = "2-6 - Excavation Site"
level_rooms[l] = rm_egg5
l++
level_names[l] = "2-7 - NAME"
level_rooms[l] = rm_intro // TODO NEW LEVEL
l++
level_names[l] = "2-8 - NAME"
level_rooms[l] = rm_intro // TODO NEW LEVEL
l++
#endregion

#region world 3
level_names[l] = "3-1 - Sugar Town"
level_rooms[l] = rm_sugar1
l++
level_names[l] = "3-2 - The Big Launch"
level_rooms[l] = rm_sugar2
l++
level_names[l] = "3-3 - Back Then Fourth"
level_rooms[l] = rm_sugar3
l++
level_names[l] = "3-4 - The Long Haul"
level_rooms[l] = rm_sugar4
l++
level_names[l] = "3-5 - NAME"
level_rooms[l] = rm_egg4 // TODO MAKE LEVEL
l++
level_names[l] = "3-6 - The Longer Haul"
level_rooms[l] = rm_sugar5
l++
level_names[l] = "3-7 - NAME"
level_rooms[l] = rm_intro // TODO MAKE LEVEL
l++
level_names[l] = "3-8 - NAME"
level_rooms[l] = rm_intro // TODO MAKE LEVEL
l++
#endregion

#region world 4
level_names[l] = "4-1 - Buttery Butterson"
level_rooms[l] = rm_butter1
l++
level_names[l] = "4-2 - The Magic of Flour"
level_rooms[l] = rm_butter2
l++
level_names[l] = "4-3 - 50 Foot Drop Test"
level_rooms[l] = rm_butter3
l++
level_names[l] = "3-4 - Drop Flight"
level_rooms[l] = rm_butter4
l++
level_names[l] = "4-5 - NAME"
level_rooms[l] = rm_egg4 // TODO MAKE LEVEL
l++
level_names[l] = "4-6 - NAME"
level_rooms[l] = rm_sugar5 // TODO MAKE LEVEL
l++
level_names[l] = "4-7 - NAME"
level_rooms[l] = rm_intro // TODO MAKE LEVEL
l++
level_names[l] = "4-8 - The Finale"
level_rooms[l] = rm_butter5 // TODO MAKE LEVEL
l++
#endregion