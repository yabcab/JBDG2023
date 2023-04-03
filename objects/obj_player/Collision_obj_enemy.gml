y -= 5
instance_destroy(other)
var dir = point_direction(other.x,other.y,x,y)
var sp = 20
hsp = lengthdir_x(sp,dir)
vsp = lengthdir_y(sp,dir)