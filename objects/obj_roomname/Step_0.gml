if doyoff
	yoff++
else if yoff > 0
	yoff -= 4

if yoff > 200
	instance_destroy()