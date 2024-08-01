
draw_self();

draw_text(x, y + 32, string(state));
draw_text(x, y + 42, string(image_index));

/*
if notenough_text == true
{
	if global.language == "Korean"
	{var text = "마나가 부족해"}
	if global.language == "English"
	{var text = "not enough mana"}
	var text_width = string_width(text);
	draw_text(x - text_width/2, y - 48, text);
}
if notready_text == true
{
	if global.language == "Korean"
	{var text = "아직은 힘들어"}
	if global.language == "English"
	{var text = "not ready yet"}
	var text_width = string_width(text);
	draw_text(x - text_width/2, y - 48, text);
}

if state == "Death"
{
	var height = 32;
	draw_rectangle_color(x - 12 , y - height , x + 12 - (revive_count / revive_maxcount)*24, y - (height-2), c_white, c_white, c_white, c_white, false);
	draw_sprite(enemy_healthbar_s, 0, x-12, y-height);
	
	var text = "Press '" + input.UI_interaction + "' button"
	var text_width = string_width(text);
	draw_text(x - text_width/2, y - 48, text);
}

if dia_switch == true
{
	var text_width = string_width(diatext);
	var text_height = string_height(diatext);

	draw_rectangle_color(x - text_width/2 - 4, y - 62, x + text_width/2 + 4, y + text_height -58, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
	draw_rectangle_color(x - text_width/2 - 2, y - 61, x + text_width/2 + 2, y + text_height -59, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
	draw_text(x - text_width/2, y - 60, diatext);
}
*/
