

// 스킬트리 초기화 함수
function init_skill_tree() {
	global.skilltree_wealth = ds_map_create();
	var _startnum = 1;
	ds_map_add(global.skilltree_wealth, "skill_pray", Skill(1, load_skill_text(_startnum), load_skill_text(_startnum+1), [0,0], [],100));
	ds_map_add(global.skilltree_wealth, "skill_minpriceup1", Skill(2, load_skill_text(_startnum+2), load_skill_text(_startnum+3), [0,0], ["skill_pray"],100));
	ds_map_add(global.skilltree_wealth, "skill_fixpriceup1", Skill(3, load_skill_text(_startnum+4), load_skill_text(_startnum+5), [0,0], ["skill_pray"],100));
	
    //ds_list_add(tree, "skill_pray", Skill("Pray", "Increases prayer power", [], 100));
    //ds_list_add(tree, "skill_minpriceup1", Skill("skill_minpriceup1", "Increases gold income", ["skill_pray"], 200));
}


function apply_skill_effect(skill_id) {
    switch (skill_id) {
        case "skill_pray":
           global.piety += 50;
            break;
        case "skill_minpriceup1":
            oGame.price_min += 5;
            break;
        case "skill_fixpriceup1":
            oGame.price_basic += 5;
            break;
        // 추가 스킬 효과들...
    }
}


function load_skill_text(_linenum)
{
	//텍스트 파일 호출
	var file = file_text_open_read(working_directory + "Skill_description.txt");
	var _text = "";
	for (var i = 0; i < 180; i++;)
	{
		var _raw_text = "";
	    text[i] = file_text_read_string(file);
		_raw_text = text[i];
		var _processed_text = replace_player_name(_raw_text);
		text[i] = _processed_text;
	    file_text_readln(file);
	}
	file_text_close(file);
	return text[_linenum];
}

// 스킬 구조체 정의
function Skill(skillnum, name, description, position, prerequisites, piety_cost) {
    var skill = ds_map_create();
	skill[? "skillnum"] = skillnum;
    skill[? "name"] = name;
    skill[? "description"] = description;
    skill[? "prerequisites"] = prerequisites;
    skill[? "unlocked"] = false;
    skill[? "piety_cost"] = piety_cost; // 재화 필요량 추가
	skill[? "position"] = [0,0];
    return skill;
}


// 스킬 습득 가능 여부 확인
function can_unlock(skill_id) {
	/*
    var skill = ds_map_find_value(global.skilltree_wealth, skill_id);
    if (skill[? "unlocked"] == true) {return false;}
	*/
	if (ds_map_find_value(global.skilltree_wealth, "unlocked") == true)	{return false;}
    // 선행 스킬 조건 확인
    var prerequisites = global.skilltree_wealth[? "prerequisites"];
    for (var i = 0; i < array_length_1d(prerequisites); i++) {
        if (!ds_map_find_value(global.skilltree_wealth, prerequisites[i])[? "unlocked"]) {
            return false;  // 선행 스킬이 해금되지 않으면 false
        }
    }

    if (global.piety < global.skilltree_wealth[? "piety_cost"]) {
        return false;  // 재화가 부족할 경우 false
    }

    return true;
}

// 스킬 습득 함수
function unlock_skill(skill_id) {
    var skill = ds_map_find_value(global.skilltree_wealth, skill_id);
    if (can_unlock(skill_id)) {
        skill[? "unlocked"] = true;
        global.piety -= skill[? "piety_cost"];  // 재화 차감
        apply_skill_effect(skill_id);     // 효과 적용
    }
}




// 선택된 스킬 정보 표시
function draw_skill_info() {
	var info_x = window_get_width() - 228;
	var info_y = 128;
    if (selected_skill != "") {
        var skill = ds_map_find_value(global.skilltree_wealth, selected_skill);  // 선택된 스킬의 정보 가져옴
		
        // 스킬 정보 텍스트 출력
        draw_text(info_x, info_y, "Name: " + skill[? "name"]);
        draw_text(info_x, info_y + 20, "Description: " + skill[? "description"]);
        draw_text(info_x, info_y + 40, "Cost: " + string(skill[? "piety_cost"]));
        
        // 선행 조건을 보여주는 로직
        var prerequisites = skill[? "prerequisites"];
        if (array_length_1d(prerequisites) > 0) {
            draw_text(info_x, info_y + 60, "Prerequisites: ");
            for (var i = 0; i < array_length_1d(prerequisites); i++) {
                draw_text(info_x + 20, info_y + 80 + (i * 20), string(prerequisites[i]));
            }
        } else {
            draw_text(info_x, info_y + 60, "No prerequisites");
        }
    } else {
        draw_text(info_x, info_y, "No skill selected");
    }
}



function draw_skill_tree() {
if (global.skilltree_wealth == undefined) {
    show_debug_message("Selected skill tree is not initialized.");
    return;
}

// 스킬트리 내 첫 번째 스킬 키 가져오기
var skill_key = ds_map_find_first(global.skilltree_wealth);

while (skill_key != undefined) {
	    // 스킬 정보 가져오기
	    var skill = ds_map_find_value(global.skilltree_wealth, skill_key);
	    var position = skill[? "position"];

	    // 스킬 상태에 따른 스프라이트 그리기
	    if (skill[? "unlocked"]) {
	        draw_sprite(UI_skillbox, 0, position[0] * grid_width + start_x, -position[1] * grid_height + start_y);
	    } else if (can_unlock(skill_key)) {
	        draw_sprite(UI_skillbox, 1, position[0] * grid_width + start_x, -position[1] * grid_height + start_y);
	    } else {
	        draw_sprite(UI_skillbox, 2, position[0] * grid_width + start_x, -position[1] * grid_height + start_y);
	    }

	    // 다음 스킬로 이동
	    skill_key = ds_map_find_next(global.skilltree_wealth, skill_key);
		// 선택된 스킬 강조 표시
        if (selected_skill == skill_key) {
            draw_sprite(UI_box, 15, position[0], position[1]);  // 선택된 스킬 강조 스프라이트
        }
	}
}






function handle_skill_tree_input() {
    if (keyboard_check_pressed(vk_up)) 
	{ cursor_y -= 1;
	    update_selected_skill();}
    if (keyboard_check_pressed(vk_down)) 
	{ cursor_y += 1;
	    update_selected_skill(); }
    if (keyboard_check_pressed(vk_left)) 
	{ cursor_x -= 1;
	    update_selected_skill();}
    if (keyboard_check_pressed(vk_right)) 
	{ cursor_x += 1;
	    update_selected_skill(); }

    // 스킬 습득 시
    if (can_unlock(selected_skill)) {
        if (keyboard_check(oGame.gameinput.interaction_hold)) {
            e_key_hold_time += 1;
            if (e_key_hold_time >= required_hold_time) {
                unlock_skill(selected_skill);
                e_key_hold_time = 0;
            }
        } else {
            e_key_hold_time = 0;
        }
    }
}
// 스킬 습득 시 게이지 차오르는 연출
function draw_skill_unlock_progress() {
    if (can_unlock(selected_skill)) {
        var progress = (e_key_hold_time / required_hold_time) * gauge_width;
        draw_rectangle(x, y, x + progress, y + gauge_height, false);  // 게이지 그리기
    }
}
