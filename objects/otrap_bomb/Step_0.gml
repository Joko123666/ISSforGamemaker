


if place_meeting(x, y, oPlayer)	&& state == "Deactive"
{
	state = "Active";
	state_set_sprite(sTrap_bomb01, 1, 0);
	image_alpha = 1;
}

if state == "Active"
{
	if animation_end()
	{
		instance_create_layer(x, y, "Instances", oExplosion01)
		instance_destroy();
	}
}