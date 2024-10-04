// oSkillTree Create 이벤트
skill_ids = ds_list_create();
skills = ds_map_create();

// 스킬트리 데이터 초기화
ds_list_add(skill_ids, "skill_pray");
ds_list_add(skill_ids, "skill_minpriceup1");
ds_list_add(skill_ids, "skill_maxhunger1");

// 스킬 위치 설정 (격자 구조로 저장)
skill_positions = ds_map_create();
ds_map_add(skill_positions, "skill_pray", [0, 0]);
ds_map_add(skill_positions, "skill_minpriceup1", [1, 0]);
ds_map_add(skill_positions, "skill_maxhunger1", [2, 0]);

// 선택된 스킬 초기화
selected_skill = "";
selected_position = [0, 0];  // 처음엔 첫 스킬이 선택되도록 설정

isOpen = false;

grid_width = 5;
grid_height = 5;

e_key_hold_time = 0; // E 키 누른 시간
required_hold_time = 60; // 1초 (60프레임 기준)

error_time = 0;