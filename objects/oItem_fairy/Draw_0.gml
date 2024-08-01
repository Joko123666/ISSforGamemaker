draw_self();


var rec_length = 64;
var rec_height = 16;
var y_distance = 96;
var rec_progress = rec_length * (duration_count/duration_time);

if (place_meeting(x, y, oPlayer))	&& (isActive == false)	&& (act_count <= 0)
{
	draw_interaction(x, y - y_distance, 1);
}
else if (isActive == true)
{
	draw_set_color(c_gray)
	draw_rectangle(x - rec_length/2 -2, y - y_distance -2, x + rec_length/2 +2, y - y_distance + 18, 0);
	draw_set_color(c_aqua)
	draw_rectangle(x - rec_length/2, y - y_distance, x - rec_length/2 + rec_progress, y - y_distance + 16, 0);
}

