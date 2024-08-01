
act_count = 0;
deactivate_count = 10;

state = "Stand";

op_border = 8;
op_space = 32;

pos = 0;

option[0, 0] = "빵";
option[0, 1] = "고기스튜";
option[0, 2] = "청슬라임 푸딩";
option[0, 3] = "만드라고라 스프";
option[0, 4] = "취소";

op_length = array_length(option[0]);
menu_level = 0;

width = 156 ;
height = op_length*op_space +op_border*2;

