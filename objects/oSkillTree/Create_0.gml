// 선택된 스킬 초기화
selected_skill = "";
selected_position = [0, 0];  // 처음엔 첫 스킬이 선택되도록 설정

isOpen = false;

grid_width = 25;
grid_height = 25;
cusor_x = 0;
cusor_y = 0;

e_key_hold_time = 0; // E 키 누른 시간
required_hold_time = 60; // 1초 (60프레임 기준)

error_time = 0;