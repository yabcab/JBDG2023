time++
bobsin = sin(time / 25) * 5
aft1sin = sin(time / 20) * 4
aft1cos = cos(time / 20) * 4
aft2sin = sin((time + 180) / 20) * 4
aft2cos = cos((time + 180) / 20) * 4

if followplayer
{
	x = lerp(x,obj_player.x,0.05)
	y = lerp(y,obj_player.y + obj_player.yoff,0.05)
}