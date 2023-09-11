function init_vars() // this is gonna look stupid out of the project it was taken from so lol
// 3/21/23 - ok looking at this again this is fucked up lmfao
{
	//collider
	use_enemysolids = false
	grounded = false
	hsp = 0
	vsp = 0
	grav = 0
	jumping = false
	slope_on_middle = false
	previousframe_sloped = false
	ignore_collides = false
	
	//pauser
	is_paused = false
	hsp_s = 0
	vsp_s = 0
	facing_s = 0
	state_s = 0
	img_s = 0
	hspeed_s = 0
	vspeed_s = 0
	alph_s = 0
	ang_s = 0
	
	//other
	facing = 1
	state = 0
	is_player = false
	inv = false
	inv_alph = 1
	invtimer = 0
	invflashtimer = 0
	broimdead = false
}