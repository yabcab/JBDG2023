hsp = 3 * facing
var solid_in_way = place_meeting(x + hsp + facing,y,obj_solid)
var no_ground_left = ((!position_meeting(bbox_left - hsp,bbox_bottom + 1,obj_solid) && !position_meeting(bbox_left - hsp,bbox_bottom + 1,obj_platform)) && facing = -1)
var no_ground_right = ((!position_meeting(bbox_right + hsp,bbox_bottom + 1,obj_solid) && !position_meeting(bbox_right + hsp,bbox_bottom + 1,obj_platform)) && facing = 1)
if grounded
{
	if no_ground_left
	{
		x += 5
		facing = 1
	}
	if no_ground_right
	{
		x -= 5
		facing = -1
	}
	if solid_in_way
	{
		x -= 5 * facing
		facing *= -1
	}
}

vsp = approach(vsp,14,0.4)

collider_step()