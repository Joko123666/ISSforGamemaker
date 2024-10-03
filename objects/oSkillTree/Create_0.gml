// oSkillTree 생성 이벤트
//#macro INVENTORY_SLOTS 15
row_length = 5;

skills = ds_map_create();

/*
// 스킬 추가 (이름, 설명, 선행 스킬 ID 배열)
ds_map_add(skills, "skill_0", Skill("Skill 0", "Description of Skill 0", []));
ds_map_add(skills, "skill_1", Skill("Skill 1", "Description of Skill 1", ["skill_0"]));
ds_map_add(skills, "skill_2", Skill("Skill 2", "Description of Skill 2", ["skill_0"]));
ds_map_add(skills, "skill_3", Skill("Skill 3", "Description of Skill 3", ["skill_1"]));
ds_map_add(skills, "skill_4", Skill("Skill 4", "Description of Skill 4", ["skill_2"]));
ds_map_add(skills, "skill_5", Skill("Skill 5", "Description of Skill 5", ["skill_3", "skill_4"]));

// 스킬 ID를 쉽게 참조하기 위한 배열
skill_ids = ds_list_create();
ds_list_add(skill_ids, "skill_0");
ds_list_add(skill_ids, "skill_1");
ds_list_add(skill_ids, "skill_2");
ds_list_add(skill_ids, "skill_3");
ds_list_add(skill_ids, "skill_4");
ds_list_add(skill_ids, "skill_5");

// 스킬 위치 정의 (격자 형태)
skill_positions = ds_map_create();
ds_map_add(skill_positions, "skill_0", [0, 0]);
ds_map_add(skill_positions, "skill_1", [0, 1]);
ds_map_add(skill_positions, "skill_2", [-1, 1]);
ds_map_add(skill_positions, "skill_3", [0, 2]);
ds_map_add(skill_positions, "skill_4", [-1, 2]);
ds_map_add(skill_positions, "skill_5", [0, 3]);

isOpen = false;
selected_position = [0, 0]; // [x, y]
selected_skill = "skill_0";


grid_width = 5;
grid_height = 5;

e_key_hold_time = 0; // E 키 누른 시간
required_hold_time = 60; // 1초 (60프레임 기준)
