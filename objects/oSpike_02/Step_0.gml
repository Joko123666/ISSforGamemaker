
if act_count > 0 {act_count--;}

if place_meeting(x, y, oPlayer)
{
	creat_hitbox(oPlayer.x, oPlayer.y, self, area_3232, knockback_power, 1, attack_power, 1);
}

if dir == 1
{x += spd}
if dir == 2
{x -= spd}
if dir == 3
{y -= spd}
if dir == 4
{y += spd}
	
if act_count <= 0
{
	if place_meeting(x, y, oWall)	or place_meeting(x, y, otrap_actpoint)
	{
		if dir == 1
		{dir = 2; act_count = 3; }
		else if dir == 2
		{dir = 1; act_count = 3;}
		else if dir == 3
		{dir = 4; act_count = 3;}
		else if dir == 4
		{dir = 3; act_count = 3;}
	}
}

