x = obj_player.x
y = obj_player.y

var ls = 0.15
image_xscale = lerp(image_xscale,1,ls)
image_yscale = lerp(image_yscale,1,ls)

if !obj_player.broimdead
	instance_destroy()