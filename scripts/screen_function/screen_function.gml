
function screen_color(_color)
{
	draw_rectangle_color(0, 0, display_get_width(), display_get_height(), _color, _color, _color, _color, 0);
}

function screen_color_alpha(_color, _alpha)
{
	draw_set_alpha(_alpha);
	draw_rectangle_color(0, 0, display_get_width(), display_get_height(), _color, _color, _color, _color, 0);
	draw_set_alpha(1);
}