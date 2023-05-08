depth = -1
init_vars()
gamepad_set_axis_deadzone(0,0.3)

jumping = false
soundpick = choose(sfx_run1,sfx_run2)
runtimer = 0
checkpointx = xstart
checkpointy = ystart
arrowoff = -15
arrowalph = 0
time = 0
arrowbob = 0
arrowframetime = 0
arrowframe = 0
yoff = 0
yoffspeed = 0
levelcomplete = false
facing = 1
broimdead = false
deadtimer = 0
hasdoublejump = true
cangolf = true
drawray = false
rot = 0

anim_jump = false
anim_hurt = false

// 4/20/23 - i predict there will be like 4 states in total
enum states
{
	none = -1,
	normal,
	rocket,
	golf,
	
}
state = states.normal

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
