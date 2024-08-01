// oSkillTree 그리기 이벤트
if (isOpen == true) {
	var _dis = 64;
    var x_start = display_get_gui_width()/4 + _dis;
    var y_start = display_get_gui_height() - 254 + _dis; // 아래에서 시작
    var cell_width = 64;
    var cell_height = 64;
    var info_x = x_start + grid_width * cell_width + 50;
    var info_y = y_start;
	
    
    // 배경 그리기(좌, 우)
    draw_sprite_stretched(UI_box, 7, _dis, _dis, (display_get_gui_width() - _dis*2)/2, display_get_gui_height() - _dis*2);
	draw_sprite_stretched(UI_box, 7, _dis +(display_get_gui_width() - _dis*2)/2, _dis, (display_get_gui_width() - _dis*2)/2, display_get_gui_height() - _dis*2);
	
    // 왼쪽 스킬트리 창 그리기
    for (var i = 0; i < ds_list_size(skill_ids); i++) {
        var skill_id = ds_list_find_value(skill_ids, i);
        var skill = ds_map_find_value(skills, skill_id);
        var position = ds_map_find_value(skill_positions, skill_id);

        // 스킬 위치 계산
        var x_pos = x_start + position[0] * cell_width;
        var y_pos = y_start - position[1] * cell_height; // 아래에서 위로

        // 스킬 상태에 따른 이미지 설정
        if (skill.unlocked) {
            draw_sprite(UI_skillbox, 0, x_pos, y_pos);
        } else if (can_unlock(skill_id)) {
            draw_sprite(UI_skillbox, 1, x_pos, y_pos);
        } else {
            draw_sprite(UI_skillbox, 2, x_pos, y_pos);
        }

        // 선택된 스킬 강조 표시
        if (selected_skill == skill_id) {
            draw_sprite(UI_box, 15, x_pos, y_pos);
        }
    }

    // 커서 그리기 (스킬 칸 위에 있지 않은 경우)
    var cursor_x = x_start + selected_position[0] * cell_width;
    var cursor_y = y_start - selected_position[1] * cell_height; // 아래에서 위로
    draw_sprite(UI_box, 14, cursor_x, cursor_y);

    // 오른쪽 정보 창 그리기
    if (selected_skill != "") {
        var skill = ds_map_find_value(skills, selected_skill);
        draw_text(info_x, info_y, "Skill: " + skill.name);
        draw_text(info_x, info_y + 20, "Description: " + skill.description);
    } else {
        draw_text(info_x, info_y, "No skill selected.");
    }

    // E 키 누를 때 게이지 표시
    if (keyboard_check(ord("E")) && can_unlock(selected_skill)) {
        var gauge_width = 100;
        var gauge_height = 10;
        var gauge_x = cursor_x;
        var gauge_y = cursor_y - 20;
        var filled_width = (e_key_hold_time / required_hold_time) * gauge_width;
        draw_rectangle(gauge_x, gauge_y, gauge_x + gauge_width, gauge_y + gauge_height, false);
        draw_rectangle(gauge_x, gauge_y, gauge_x + filled_width, gauge_y + gauge_height, true);
    }
}
