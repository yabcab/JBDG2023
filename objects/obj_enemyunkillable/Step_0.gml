if !hitting
	hsp = 2 * facing
else
	hsp = 0
	
var solid_in_way = place_meeting(x + hsp + facing,y,obj_solid)
var no_ground_left = ((!position_meeting(bbox_left - hsp,bbox_bottom + 1,obj_solid) && !position_meeting(bbox_left - hsp,bbox_bottom + 1,obj_platform)) && facing = -1)
var no_ground_right = ((!position_meeting(bbox_right + hsp,bbox_bottom + 1,obj_solid) && !position_meeting(bbox_right + hsp,bbox_bottom + 1,obj_platform)) && facing = 1)
if solid_in_way || no_ground_left || no_ground_right
{
	x -= 5 * facing
	facing *= -1
}

vsp = approach(vsp,14,0.4)

collider_step()

if hitting
	sprite_index = spr_enemyangry_hitting
else
	sprite_index = spr_enemyangry_walk