// oSkillTree 스텝 이벤트
if (keyboard_check_pressed(ord("T"))) {
    isOpen = !isOpen;
    if (isOpen) {
        selected_position = [0, 0]; // 스킬트리가 열릴 때 첫 스킬을 선택
        selected_skill = "skill_0";
        oPlayer.state = "Stay";
    } else {
        oPlayer.state = "Move";
    }
}

if (isOpen) {
    if (keyboard_check_pressed(vk_left)) {
        selected_position[0] -= 1;
        update_selected_skill();
    }
    if (keyboard_check_pressed(vk_right)) {
        selected_position[0] += 1;
        update_selected_skill();
    }
    if (keyboard_check_pressed(vk_up)) {
        selected_position[1] += 1; // 방향 변경
        update_selected_skill();
    }
    if (keyboard_check_pressed(vk_down)) {
        selected_position[1] -= 1; // 방향 변경
        update_selected_skill();
    }

    // E 키를 눌러서 습득하기
    if (selected_skill != "" && !ds_map_find_value(skills, selected_skill).unlocked && can_unlock(selected_skill)) {
        if (keyboard_check(ord("E"))) {
            e_key_hold_time += 1;
            if (e_key_hold_time >= required_hold_time) {
                unlock_skill(selected_skill);
                e_key_hold_time = 0; // 초기화
            }
        } else {
            e_key_hold_time = 0; // 초기화
        }
    } else {
        e_key_hold_time = 0; // 초기화
    }
}

function update_selected_skill() {
    for (var i = 0; i < ds_list_size(skill_ids); i++) {
        var skill_id = ds_list_find_value(skill_ids, i);
        var position = ds_map_find_value(skill_positions, skill_id);
        if (position[0] == selected_position[0] && position[1] == selected_position[1]) {
            selected_skill = skill_id;
            return;
        }
    }
    selected_skill = "";
}
