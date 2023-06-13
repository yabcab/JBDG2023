timer_sec++
if timer_sec >= 60
{
	timer_sec = 0
	timer_min++	
	if timer_min >= 60
	{
		timer_min = 0
		timer_hour++
	}
}
alarm[0] = 60