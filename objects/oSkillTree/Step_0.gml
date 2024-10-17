// oSkillTree 스텝 이벤트
if (oGame.gameinput.interaction) && (distance_to_object(oPlayer) < 32)
{
    if (!isOpen) {isOpen = true;}
    if (isOpen) {
        selected_position = [0, 0]; // 스킬트리가 열릴 때 첫 스킬을 선택
        selected_skill = "skill_pray";
        oPlayer.state = "Stay";
    } else {
        oPlayer.state = "Move";
    }
}

if (isOpen) {
    // oSkillTree Step 이벤트
	if (keyboard_check_pressed(vk_left)) {
	    selected_position[0] -= 1;
	    update_selected_skill();
	}
	if (keyboard_check_pressed(vk_right)) {
	    selected_position[0] += 1;
	    update_selected_skill();
	}
	if (keyboard_check_pressed(vk_up)) {
	    selected_position[1] -= 1;
	    update_selected_skill();
	}
	if (keyboard_check_pressed(vk_down)) {
	    selected_position[1] += 1;
	    update_selected_skill();
	}

	// 스킬 해금 (E 키를 눌렀을 때)
	if (can_unlock(selected_skill)) {
	    if (keyboard_check(ord("E"))) {
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

function update_selected_skill() {
    for (var i = 0; i < ds_list_size(global.skilltree); i++) {
        var skill_id = ds_list_find_value(skill_ids, i);
        var position = ds_map_find_value(skill_positions, skill_id);
        if (position[0] == selected_position[0] && position[1] == selected_position[1]) {
            selected_skill = skill_id;
            return;
        }
    }
    selected_skill = "";
}
