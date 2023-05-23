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

room_goto(rm_title)

if os_type = os_windows
	window_set_size(1920,1080)

show_debug_overlay(true)

//when i have music playing
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
#macro KEY_R keyboard_check(vk_right)
#macro KEY_U keyboard_check(vk_up)
#macro KEY_D keyboard_check(vk_down)
#macro KEY_JMP keyboard_check(ord("Z"))
#macro KEY_JMP_P keyboard_check_pressed(ord("Z"))
#macro KEY_EGG_P keyboard_check_pressed(ord("X"))
