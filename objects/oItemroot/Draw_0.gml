draw_self();
draw_set_font(Font01);

if (isact == false) && place_meeting(x, y, oPlayer)
{draw_interaction(x, y - 64, 1);}

if (act_count > 0)
{draw_ellipse(x-4, y-64, x + 4, y - 56, 0);}

var y_point = y - 64;
var bar_width = 128;
var bar_height = 12;
var bar_col = c_gray;
var x_point = x - bar_width/2;

var grade1_col = c_white;
var grade2_col = c_teal;
var grade3_col = c_navy;
var grade4_col = c_blue;
var grade5_col = c_yellow;

var grade1_width = bar_width * root_probability_table[root_grade][1]/100;
var grade2_width = (bar_width * root_probability_table[root_grade][2]/100) + grade1_width;
var grade3_width = (bar_width * root_probability_table[root_grade][3]/100) + grade2_width;
var grade4_width = (bar_width * root_probability_table[root_grade][4]/100) + grade3_width;
var grade5_width = (bar_width * root_probability_table[root_grade][5]/100) + grade4_width;

if (isact == true && isfail == false)
{
	//외곽박스 드로우 
var box_x = x - 80;
var box_y = y - 140;
var box_width = 160;
var box_height = 100;
var _dis = 20;
draw_sprite_stretched_ext(UI_box, 7, box_x, box_y, box_width, box_height, c_white, 1);

//전체 드로우(외곽선)
draw_rectangle_color(x_point, y_point, x_point + bar_width, y_point + bar_height, bar_col, bar_col, bar_col, bar_col, 0);
draw_sprite(UI_digging_defalt, root_grade, box_x +10, box_y +10);
//각 확률 드로우
draw_rectangle_color(x_point, y_point, x_point + grade1_width, y_point + bar_height, grade1_col, grade1_col, grade1_col, grade1_col, 0);
draw_rectangle_color(x_point + grade1_width, y_point, x_point + grade2_width, y_point + bar_height, grade2_col, grade2_col, grade2_col, grade2_col, 0);
draw_rectangle_color(x_point + grade2_width, y_point, x_point + grade3_width, y_point + bar_height, grade3_col, grade3_col, grade3_col, grade3_col, 0);
draw_rectangle_color(x_point + grade3_width, y_point, x_point + grade4_width, y_point + bar_height, grade4_col, grade4_col, grade4_col, grade4_col, 0);
draw_rectangle_color(x_point + grade4_width, y_point, x_point + bar_width, y_point + bar_height, grade5_col, grade5_col, grade5_col, grade5_col, 0);

draw_text(x_point, box_y - _dis*1, "실패확률 : " + string(root_probability_table[root_grade][0]) + "%");
draw_text(x_point, box_y - _dis*2, "채집단계 : " + string(root_grade));
draw_text(x_point, box_y - _dis*3, "조작 || 파기 : Q  뽑기 : E");


}
if (isfail == true)
{
	draw_text_color(x, y-126, "채집 실패!", c_red, c_red, c_red, c_red, 1);
}

