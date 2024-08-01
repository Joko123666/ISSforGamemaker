draw_self();


if (place_meeting(x, y, oPlayer))	&& (isActive == false)	&& (act_count <= 0)
{
	var _text = "기도를 바친다";
	draw_interaction(x, y - 64, 1);
	draw_text(x-24, y - 96, _text);
}
