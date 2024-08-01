draw_self();
draw_set_font(Font01);
draw_set_color(#363636);

if (isact == false) && place_meeting(x, y, oPlayer)
{draw_interaction(x, y - 64, 1);}

if (act_count > 0)
{draw_ellipse(x-4, y-64, x + 4, y - 56, 0);}

var y_point = y - 64;
var bar_width = 128;
var bar_height = 12;
var bar_col = c_gray;
var x_point = x - bar_width/2;

wood_hppercent = wood_hp / wood_maxhp;
draw_woodhp = lerp(draw_woodhp, wood_hppercent, 0.2);
draw_redhp = lerp(draw_redhp, wood_hppercent, 0.05);

if (isact == true && isfail == false)
{
	var _dis = 64;
//전체 드로우(외곽선)
draw_rectangle_color(x_point, y_point, x_point + bar_width, y_point + bar_height, bar_col, bar_col, bar_col, bar_col, 0);
//각 확률 드로우
draw_rectangle_color(x_point, y_point, x_point + bar_width* draw_redhp, y_point + bar_height, c_red, c_red, c_red, c_red, 0);
draw_rectangle_color(x_point, y_point, x_point + bar_width* draw_woodhp, y_point + bar_height, c_yellow, c_yellow, c_yellow, c_yellow, 0);

draw_set_color(c_white);
draw_text(x_point, y - 136, "목재 상태 : " + string(wood_hp));
draw_text(x_point, y - 156, "조작 || 철수: Q  도끼질 : E");

draw_sprite(UI_wood_defalt, image_num, x_point + _dis*2, y_point);
}
if (isfail == true)
{
	draw_text_color(x, y-126, "더이상 힘이 남아있지 않다!", c_red, c_red, c_red, c_red, 1);
}

