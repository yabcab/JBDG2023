image_alpha = approach(image_alpha,setthelight,0.025)
if !set && image_alpha >= 1 && setthelight
{
	set = true
	alarm[1] = 100
}