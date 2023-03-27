init_vars()
gamepad_set_axis_deadzone(0,0.3)

jumping = false
soundpick = choose(sfx_run1,sfx_run2)
runtimer = 0
checkpointx = xstart
checkpointy = ystart

#macro CONT_A gp_face1
#macro CONT_RB gp_shoulderrb
#macro CONT_RT gp_shoulderr
#macro CONT_LB gp_shoulderlb
#macro CONT_LT gp_shoulderl

//NOTE - keyboard support comes SECOND. 
//you are building Trails and Tribulations primarily to be run on XBOX UWP WITH A CONTROLLER!!
//bitch
#macro KEY_L keyboard_check(vk_left)
#macro KEY_R keyboard_check(vk_right)
#macro KEY_JMP keyboard_check(ord("Z"))
#macro KEY_JMP_P keyboard_check_pressed(ord("Z"))