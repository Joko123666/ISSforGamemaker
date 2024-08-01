
draw_self();
//상호작용 버튼 표시
if (act_count <= 0)	&& place_meeting(x, y, oPlayer)
{
	draw_interaction(x, y - 64, 2);
	var _priceText = string( global.skilltree_temple_price[skill_i][skill_num]);
	draw_sprite(UI_sprite, 8, x-22, y + 20);
	draw_text(x , y + 22, _priceText);
	
	//draw_text(x - 20, y + 30, skill_i);
	//draw_text(x , y + 30, skill_num);
}
if (isActive == true)
{
	var rec_length = 24;
	var rec_height = 16;
	var y_distance = 96;
	var rec_progress = rec_length * (duration_count/duration_time);

	draw_set_color(c_gray)
	draw_rectangle(x - rec_length/2 -2, y - y_distance -2, x + rec_length/2 +2, y - y_distance + 18, 0);
	draw_set_color(c_aqua)
	draw_rectangle(x - rec_length/2, y - y_distance, x - rec_length/2 + rec_progress, y - y_distance + 16, 0);
}