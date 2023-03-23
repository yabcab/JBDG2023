dist = distance_to_object(obj_player)

var ls = 0.1
if dist < 200
{
	//glubble
	textoff = lerp(textoff,0,ls)
	image_alpha = lerp(image_alpha,1,ls)
}
else
{
	//antiglubble
	textoff = lerp(textoff,50,ls)
	image_alpha = lerp(image_alpha,0,ls)
}