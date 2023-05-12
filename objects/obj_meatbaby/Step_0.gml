if x != follow.x
	facing = sign(x - follow.x)

if distance_to_object(obj_meatdunk) > 150
{
	var ls = 0.06
	x = lerp(x,follow.x - (50 * follow.facing),ls)
	y = lerp(y,follow.y - 50,ls)
}
else
{
	var ls = 0.15
	x = lerp(x,obj_meatdunk.x,ls)
	y = lerp(y,obj_meatdunk.y,ls)
}
	
time++
bobsin = sin(time / 25) * 4