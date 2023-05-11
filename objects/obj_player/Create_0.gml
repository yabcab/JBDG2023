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
anim_egg = false

// 4/20/23 - i predict there will be like 4 states in total
enum states
{
	none = -1,
	normal,
	rocket,
	golf,
	
}
state = states.normal

make_shadow()