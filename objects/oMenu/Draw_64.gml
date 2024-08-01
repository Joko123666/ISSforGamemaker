
var _new_w = 0;
//draw option
draw_set_font(TitleFont);
draw_set_color(c_dkgray);

draw_set_valign(fa_top);
draw_set_halign(fa_left);

for (var i = 0; i < op_length; i++)
{
	var _op_w = string_width(option[menu_level, i]);
	_new_w = max(_new_w, _op_w);
}
width = _new_w + op_border*2 + op_space;
height = op_border*2 + 10 + (op_length )*op_space;

//메뉴를 화면 가운데로 정렬
var _x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2;
var _y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 -height/2 + 200;

//매뉴 전체 배경 그리기
draw_sprite_ext(UI_box, 7, _x, _y, width/sprite_width, height/sprite_height, 0, c_white, 1);



//draw_text
for (i = 0; i < op_length; i++)
{
	var _c = c_white;
	if (pos == i) {_c = c_yellow}
	draw_text_color(_x+op_border, _y+op_border*2+op_space*i, option[menu_level, i], _c, _c, _c, _c, 1);
}
