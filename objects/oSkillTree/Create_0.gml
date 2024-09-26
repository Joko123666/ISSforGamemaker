// oSkillTree 생성 이벤트
//#macro INVENTORY_SLOTS 15
row_length = 5;

skills = ds_map_create();
skills_wealth = ds_map_create();

#region Wealth_skilltree
// 스킬 추가 (이름, 설명, 선행 스킬 ID 배열)
var skill_start_num = 1;
ds_map_add(skills_wealth, "skill_pray", Skill(string(load_skill_text(skill_start_num)), string(load_skill_text(skill_start_num+1)), []));
ds_map_add(skills_wealth, "skill_minpriceup1", Skill(string(load_skill_text(skill_start_num+2)), string(load_skill_text(skill_start_num+3)), ["skill_pray"]));
ds_map_add(skills_wealth, "skill_maxhunger1", Skill(string(load_skill_text(skill_start_num+4)), string(load_skill_text(skill_start_num+5)), ["skill_pray"]));
ds_map_add(skills_wealth, "skill_pricerateup1", Skill(string(load_skill_text(skill_start_num+6)), string(load_skill_text(skill_start_num+7)), ["skill_pray"]));
ds_map_add(skills_wealth, "skill_varpriceup1", Skill(string(load_skill_text(skill_start_num+8)), string(load_skill_text(skill_start_num+9)), ["skill_pray"]));
ds_map_add(skills_wealth, "skill_allpriceup1", Skill(string(load_skill_text(skill_start_num+10)), string(load_skill_text(skill_start_num+11)), ["skill_pricerateup1", "skill_varpriceup1", "skill_minpriceup1"]));

// 스킬 ID를 쉽게 참조하기 위한 배열
skills_wealth_ids = ds_list_create();
ds_list_add(skills_wealth_ids, "skill_pray");
ds_list_add(skills_wealth_ids, "skill_minpriceup1");
ds_list_add(skills_wealth_ids, "skill_maxhunger1");
ds_list_add(skills_wealth_ids, "skill_pricerateup1");
ds_list_add(skills_wealth_ids, "skill_varpriceup1");
ds_list_add(skills_wealth_ids, "skill_allpriceup1");

// 스킬 위치 정의 (격자 형태)
skill_wealth_positions = ds_map_create();
ds_map_add(skill_wealth_positions, "skill_pray", [0, 0]);
ds_map_add(skill_wealth_positions, "skill_minpriceup1", [0, 1]);
ds_map_add(skill_wealth_positions, "skill_maxhunger1", [-1, 1]);
ds_map_add(skill_wealth_positions, "skill_pricerateup1", [1, 1]);
ds_map_add(skill_wealth_positions, "skill_varpriceup1", [2, 1]);
ds_map_add(skill_wealth_positions, "skill_allpriceup1", [0, 2]);

isOpen = false;
selected_position = [0, 0]; // [x, y]
selected_skill = "skill_pray";
#endregion

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
*/

grid_width = 5;
grid_height = 5;

e_key_hold_time = 0; // E 키 누른 시간
required_hold_time = 60; // 1초 (60프레임 기준)
