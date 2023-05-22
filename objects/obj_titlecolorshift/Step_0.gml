col = approach(col,coltar,0.005)
if col = coltar && coltar = 6
{
	col = 1
	coltar = 1
}

if !set && obj_gameintro.activated
{
	set = true
	alarm[0] = 500
}