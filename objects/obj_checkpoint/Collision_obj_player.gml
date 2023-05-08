with other
{
	checkpointx = other.x
	checkpointy = other.y
}
if !hit
{
	hit = true
	repeat 75
		instance_create_depth(x,y,depth,obj_confetti)
}