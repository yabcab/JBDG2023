image_speed = 0
image_index = irandom_range(0,5)
depth = -1
rotspd = random_range(2,8)
rotdir = choose(1,-1)
vspeed = random_range(-6,-9)
hspeed = random_range(2,-2)

var col1 = make_color_rgb(112,216,248)
var col2 = make_color_rgb(248,216,0)
var col3 = make_color_rgb(232,96,24)
var col4 = make_color_rgb(160,240,128)
image_blend = choose(col1,col2,col3,col4)

//make_shadow()