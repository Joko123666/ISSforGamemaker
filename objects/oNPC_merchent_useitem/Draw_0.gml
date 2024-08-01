
draw_self();

if place_meeting(x, y, oPlayer)	&& act_count <= 0
{
	draw_interaction(x, y - 64, 1);
}

if (state == "Selling")
{
	//draw option
	draw_set_font(Font01);
	draw_set_color(c_dkgray);

	draw_set_valign(fa_top);
	draw_set_halign(fa_center);

	var _x = x + 32;
	var _y = y - height - 32;

	//매뉴 전체 배경 그리기
	draw_sprite_stretched(UI_box, 9, _x, _y, width, height);

	//draw_text
	for (i = 0; i < op_length; i++)
	{
		var _c = c_white;
		if (pos == i) {_c = c_yellow}
		draw_sprite_stretched(UI_box, 10, _x + op_border, (_y+op_border+op_space*i), width - op_border*2, op_space - 4);
		draw_text_color(_x+width/2, _y+op_border*2+op_space*i, option[menu_level, i], _c, _c, _c, _c, 1);
	}
	//가격표시
	draw_sprite_stretched(UI_box, 10, _x - op_border*4, _y , 32, 32);
	draw_sprite(sUseitem, pos, _x - op_border*4, _y);
	if (pos != op_length -1)
	{draw_text_color(_x - op_border*2 , _y + op_border*4, string(useitem_price(pos)), c_black, c_black, c_black, c_black, 1);}
}