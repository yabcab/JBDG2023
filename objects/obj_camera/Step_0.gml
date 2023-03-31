if instance_exists(obj_player)
{
	x = lerp(x,obj_player.x,0.2)
	y = lerp(y,obj_player.y + (obj_player.yoff / 2),0.2)
}