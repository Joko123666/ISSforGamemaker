


// 게임 상태를 저장하는 구조체
function GameState() {
    return {
        player_state: oPlayer.state,
        skills: skills,
        skill_positions: skill_positions,
        unlocked_skills: get_unlocked_skills()
    };
}

// 해제된 스킬 목록을 반환하는 함수
function get_unlocked_skills() {
    var unlocked = ds_list_create();
    for (var i = 0; i < ds_list_size(skill_ids); i++) {
        var skill_id = ds_list_find_value(skill_ids, i);
        var skill = ds_map_find_value(skills, skill_id);
        if (skill.unlocked) {
            ds_list_add(unlocked, skill_id);
        }
    }
    return unlocked;
}

function draw_save_menu() {
    if (global.save_menu_open) {
        var menu_x = display_get_gui_width() / 2 - 150;
        var menu_y = display_get_gui_height() / 2 - 100;
        var menu_width = 300;
        var menu_height = 200;
        var slot_height = menu_height/global.save_slots - 8;

        // 메뉴 배경 그리기
        //draw_rectangle(menu_x, menu_y, menu_x + menu_width, menu_y + menu_height, false);
        draw_sprite_stretched(UI_box, 9, menu_x, menu_y, menu_width, menu_height);
		draw_set_color(c_white);

        // 저장 슬롯 그리기
        for (var i = 0; i < global.save_slots; i++) {
            var slot_name = "savefile_" + string(i);
            var slot_y = menu_y + 20 + i * slot_height;
            var color = (i == global.selected_slot) ? c_yellow : c_black;
			draw_sprite_stretched(UI_box, 9,menu_x + 8, slot_y, menu_width - 64, slot_height);
			draw_rectangle_color(menu_x + 20, slot_y + slot_height/2 -6, menu_x + 28, slot_y + slot_height/2 + 4, color, color, color, color, false);
            draw_text_color(menu_x + menu_width/2 - 64, slot_y + slot_height/2 - 4, ds_map_find_value(global.savefile_info, slot_name), color, color, color, color, 1);
        }
    }
}


function update_save_menu() {
    if (global.save_menu_open) {
        if (global.interaction_delay <= 0) {
            if (keyboard_check_pressed(vk_up)) {
                global.selected_slot = max(0, global.selected_slot - 1);
                global.interaction_delay = room_speed / 10; // 0.1초 딜레이
            }
            if (keyboard_check_pressed(vk_down)) {
                global.selected_slot = min(global.save_slots - 1, global.selected_slot + 1);
                global.interaction_delay = room_speed / 10; // 0.1초 딜레이
            }
            if (keyboard_check_pressed(ord("E"))) {
                save_game(global.selected_slot);
                global.save_menu_open = false;
                global.interaction_delay = room_speed / 2; // 0.5초 딜레이
				oPlayer.state = "Move";	//Player 행 동 가 능 
            }
            if (keyboard_check_pressed(vk_escape)) {
                global.save_menu_open = false;
                global.interaction_delay = room_speed / 2; // 0.5초 딜레이
            }
        }
    }
}




function save_game(slot) {
    var _saveData = ds_map_create();

    with (oPlayer) {
        var _saveEntity = ds_map_create();
        
        // Player status
        _saveEntity[? "obj"] = object_get_name(object_index);
        _saveEntity[? "y"] = y;
        _saveEntity[? "x"] = x;
        _saveEntity[? "image_index"] = image_index;
        _saveEntity[? "image_blend"] = image_blend;
        _saveEntity[? "HP"] = HP;
        _saveEntity[? "SP"] = SP;
        _saveEntity[? "maxHP"] = maxHP;
        _saveEntity[? "maxSP"] = maxSP;
        _saveEntity[? "maxHunger"] = maxHunger;
        _saveEntity[? "hunger"] = hunger;
        _saveEntity[? "maxMentality"] = maxMentality;
        _saveEntity[? "mentality"] = mentality;
        _saveEntity[? "hunger_endurance"] = hunger_endurance;
        _saveEntity[? "attackskill_set"] = attackskill_set;
        _saveEntity[? "attackskill_cool"] = attackskill_cool;
        _saveEntity[? "attackskill_coolset"] = attackskill_coolset;
        _saveEntity[? "moveskill_num"] = moveskill_num;
        _saveEntity[? "moveskill_cooldown"] = moveskill_cooldown;
        _saveEntity[? "SPD"] = SPD;
        _saveEntity[? "base_move_speed"] = base_move_speed;
        _saveEntity[? "extra_move_speed"] = extra_move_speed;
        _saveEntity[? "move_speed"] = move_speed;
        _saveEntity[? "vsp"] = vsp;
        _saveEntity[? "grv"] = grv;
        _saveEntity[? "maxjumpcount"] = maxjumpcount;
        _saveEntity[? "jumppower"] = jumppower;

        // Global variables
        _saveEntity[? "room_playeris"] = room;
        _saveEntity[? "room_direction"] = 99;
        _saveEntity[? "gold"] = global.gold;
        _saveEntity[? "piety"] = global.piety;
        _saveEntity[? "mainstream"] = global.mainstream;

        _saveData[? "player"] = _saveEntity;
    }
    
    // Save Encyclopedia
    var _encyclopedia = ds_list_create();
    for (var i = 0; i < 100; i++) {
        var _entry = ds_list_create();
        for (var j = 0; j < 10; j++) {
            ds_list_add(_entry, global.Encyclopedia[j][i]);
        }
        ds_list_add(_encyclopedia, _entry);
    }
    _saveData[? "Encyclopedia"] = _encyclopedia;

    // Save Skilltree
    var _skilltree_guild = ds_list_create();
    for (var i = 0; i < 3; i++) {
        var _guild = ds_list_create();
        for (var j = 0; j < 10; j++) {
            ds_list_add(_guild, global.skilltree_guild[i][j]);
        }
        ds_list_add(_skilltree_guild, _guild);
    }
    _saveData[? "skilltree_guild"] = _skilltree_guild;

    var _skilltree_temple = ds_list_create();
    for (var i = 0; i < 3; i++) {
        var _temple = ds_list_create();
        for (var j = 0; j < 10; j++) {
            ds_list_add(_temple, global.skilltree_temple[i][j]);
        }
        ds_list_add(_skilltree_temple, _temple);
    }
    _saveData[? "skilltree_temple"] = _skilltree_temple;

    // Turn data to JSON string and save it
    var _string = json_stringify(_saveData);
    var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
    buffer_write(_buffer, buffer_string, _string);
    buffer_save(_buffer, "savefile_" + string(slot) + ".save");
    buffer_delete(_buffer);

    // Update save slot information in the map
    var slot_name = "savefile_" + string(slot);
    ds_map_replace(global.savefile_info, slot_name, "Saved Game " + string(slot));

    show_debug_message("Game Saved! Slot: " + string(slot));
    audio_play_sound(SE_system07, 1, false);
}



function load_game(slot) {
    var filename = "savefile_" + string(slot) + ".save";
    if (file_exists(filename)) {
        with (oPlayer) instance_destroy();
    }

    if (file_exists(filename)) {
        var _buffer = buffer_load(filename);
        var _string = buffer_read(_buffer, buffer_string);
        buffer_delete(_buffer);

        var _loadData = json_parse(_string);

        var _loadEntity = _loadData[? "player"];
        with (instance_create_layer(0, 0, "Playerlayer", asset_get_index(_loadEntity[? "obj"]))) {
            room = _loadEntity[? "room_playeris"];
            x = _loadEntity[? "x"];
            y = _loadEntity[? "y"] - 24;
            image_blend = _loadEntity[? "image_blend"];
            image_index = _loadEntity[? "image_index"];
            maxHP = _loadEntity[? "maxHP"];
            maxSP = _loadEntity[? "maxSP"];
            HP = _loadEntity[? "HP"];
            SP = _loadEntity[? "SP"];
            attackskill_set = _loadEntity[? "attackskill_set"];
            attackskill_cool = _loadEntity[? "attackskill_cool"];
            attackskill_coolset = _loadEntity[? "attackskill_coolset"];
            hspd = _loadEntity[? "hspd"];
            vsp = _loadEntity[? "vsp"];
            grv = _loadEntity[? "grv"];
            SPD = _loadEntity[? "SPD"];
            maxjumpcount = _loadEntity[? "maxjumpcount"];

            // Global variables
            global.room_direction = _loadEntity[? "room_direction"];
            global.gold = _loadEntity[? "gold"];
            global.piety = _loadEntity[? "piety"];
            global.mainstream = _loadEntity[? "mainstream"];
        }

        // Load Encyclopedia
        var _encyclopedia = _loadData[? "Encyclopedia"];
        for (var i = 0; i < 100; i++) {
            for (var j = 0; j < 10; j++) {
                global.Encyclopedia[j][i] = ds_list_find_value(_encyclopedia[| i], j);
            }
        }

        // Load Skilltree
        var _skilltree_guild = _loadData[? "skilltree_guild"];
        for (var i = 0; i < 3; i++) {
            for (var j = 0; j < 10; j++) {
                global.skilltree_guild[i][j] = ds_list_find_value(_skilltree_guild[| i], j);
            }
        }

        var _skilltree_temple = _loadData[? "skilltree_temple"];
        for (var i = 0; i < 3; i++) {
            for (var j = 0; j < 10; j++) {
                global.skilltree_temple[i][j] = ds_list_find_value(_skilltree_temple[| i], j);
            }
        }

        show_debug_message("Game Loaded! Slot: " + string(slot));
        oPlayer.state = "Move";
    } else {
        show_debug_message("Save file not found in slot: " + string(slot));
    }
}



