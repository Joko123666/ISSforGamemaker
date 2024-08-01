
width = display_get_gui_width() - 160;
height = display_get_gui_height() - 120;

op_border = 12;
op_space = 56;

pos = 0;

option[0, 0] = "Start Game";
option[0, 1] = "Load Game";
option[0, 2] = "Setting";
option[0, 3] = "게임 종료";

option[2, 0] = "Volume";
option[2, 1] = "Controls";
option[2, 2] = "Language";
option[2, 3] = "Back";

op_length = array_length(option);
menu_level = 0;

