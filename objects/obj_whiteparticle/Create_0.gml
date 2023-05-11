var sp = random_range(3,5)
var dir = random_range(0,359)
hspeed = lengthdir_x(sp,dir)
vspeed = lengthdir_y(sp,dir)

image_alpha = 1
alphlower = random_range(0.01,0.02)

starth = abs(hspeed / 100)
startv = abs(vspeed / 100)

//make_shadow()