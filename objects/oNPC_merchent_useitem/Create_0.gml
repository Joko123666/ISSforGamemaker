
act_count = 0;
deactivate_count = 10;

state = "Stand";

op_border = 8;
op_space = 32;

pos = 0;

option[0, 0] = "휴대 식량";
option[0, 1] = "비상 식량";
option[0, 2] = "가속 물약";
option[0, 3] = "회복 물약";
option[0, 4] = "타운포탈 스크롤";
option[0, 5] = "취소";

op_length = array_length(option[0]);
menu_level = 0;

width = 156 ;
height = op_length*op_space +op_border*2;

