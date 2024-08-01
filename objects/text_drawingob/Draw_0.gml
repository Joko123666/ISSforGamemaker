
draw_set_halign(fa_left);

var text_width = string_width(text);
var text_height = string_height(text);

draw_rectangle_color(x - 4, y - 2, x + text_width + 4, y + text_height + 2, box_color, box_color, box_color, box_color, false);
draw_rectangle_color(x - 2, y - 1, x + text_width + 2, y + text_height + 1, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
draw_text_color(x, y, text, text_color, text_color, text_color, text_color, 1);