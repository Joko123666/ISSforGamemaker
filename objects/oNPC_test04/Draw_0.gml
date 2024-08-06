
draw_self();

if place_meeting(x, y, oPlayer)	&& act_count <= 0
{
	draw_interaction(x, y - 64, 1);
}