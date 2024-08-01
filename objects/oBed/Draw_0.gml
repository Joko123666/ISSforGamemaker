
draw_self();

var y_distance = 96;

if (place_meeting(x, y, oPlayer))	&& (isActive == false)	&& (act_count <= 0)
{
	draw_interaction(x, y - y_distance, 1);
}
else if (isActive == true)
{
	draw_progressbar(x, y - y_distance, 64, 16, duration_count, duration_time);
}