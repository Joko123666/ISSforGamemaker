


if place_meeting(x, y, oPlayer) && oPlayer.invincibility == false	&& state == "Active"
{
	creat_hitbox(x, oPlayer.y, self, area_6464, knockback_power, 1, attack_power, 1);
}

if place_meeting(x, y, oPlayer)	&& state == "Deactive"
{
	state = "Active";
	state_set_sprite(sTrap_spike01, 1, 0);
	image_alpha = 1;
}

if state == "Active"
{
	if animation_end()
	{state = "Deactive"; image_alpha = 0; image_speed = 0; sprite_index = sTrap_trigger;}
}