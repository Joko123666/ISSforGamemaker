

draw_sprite(sItems, item_id, x - 16, y - 16);

if (draw_full_message == true)
{
	var d_text = "인벤토리가 가득 찼다!";
	draw_text_color(x - string_width(d_text)/2, y - 42, d_text, c_red, c_red, c_red, c_red, 1);
}