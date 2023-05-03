var lm = 0.05
if state = 0
{
	yoff = lerp(yoff,270,lm)
	if yoff < 280 && !set0
	{
		set0 = true
		alarm[0] = 100
	}
}
else
{
	upspeed -= 0.4
	yoff += upspeed
	
	if yoff < -300
		instance_destroy()
}