
function dialog_Screen(_name, _start, _end, _spr, _imgnum, _sound)
{
	var textbox = instance_create_layer(0, 0, "Hud", oTextbox_screen)
	textbox.draw_name = _name; 
	textbox.textline_start = _start;	
	textbox.textline_end = _end;	
	textbox.page = textbox.textline_start;
	textbox.progress_set = global.dialog_process + 1;	
	textbox.sprite_set = _spr;
	textbox.sound_set = _sound;
	textbox.image_num = _imgnum;
}

function dialog_Screen_color(_name, _start, _end, _spr, _imgnum, _sound, _boxnum, _Tcolor)
{
	var textbox = instance_create_layer(0, 0, "Hud", oTextbox_screen)
	textbox.draw_name = _name; 
	textbox.textline_start = _start;	
	textbox.textline_end = _end;	
	textbox.page = textbox.textline_start;
	textbox.progress_set = global.dialog_process + 1;	
	textbox.sprite_set = _spr;
	textbox.sound_set = _sound;
	textbox.image_num = _imgnum;
	textbox.textcol = _Tcolor;
	textbox.textbox_img = _boxnum;
}

function load_dialogue(file_path) {
    var file = file_text_open_read(file_path);
    var dialogue_lines = ds_list_create();
    
    while (!file_text_eof(file)) {
        var line = file_text_read_string(file);
        ds_list_add(dialogue_lines, line);
        file_text_readln(file);
    }
    
    file_text_close(file);
    return dialogue_lines;
}

/*
function draw_dialogue() {
    if (global.current_dialogue != "") {
        var dialogue = ds_list_find_value(global.dialogue_data, global.dialogue_index);
        var displayed_text = string_copy(dialogue, 1, min(global.dialogue_timer / global.dialogue_speed, string_length(dialogue)));
        
        draw_text(50, 400, displayed_text);
        
        if (global.dialogue_timer / global.dialogue_speed >= string_length(dialogue)) {
            global.dialogue_complete = true;
        } else {
            global.dialogue_timer += 1;
        }
    }
}


function draw_choices() {
    if (global.dialogue_complete && ds_list_size(global.dialogue_choices) > 0) {
        for (var i = 0; i < ds_list_size(global.dialogue_choices); i++) {
            var choice = ds_list_find_value(global.dialogue_choices, i);
            draw_text(100, 450 + i * 20, choice);
        }
    }
}

function handle_choice_selection() {
    if (global.dialogue_complete && ds_list_size(global.dialogue_choices) > 0) {
        if (keyboard_check_pressed(vk_up)) {
            global.selected_choice = max(0, global.selected_choice - 1);
        }
        if (keyboard_check_pressed(vk_down)) {
            global.selected_choice = min(ds_list_size(global.dialogue_choices) - 1, global.selected_choice + 1);
        }
        if (keyboard_check_pressed(ord("E"))) {
            execute_choice(global.selected_choice);
        }
    }
}

function draw_visual_dialogue() {
    if (global.current_dialogue != "" && global.dialogue_mode == "visual") {
        var dialogue = ds_list_find_value(global.dialogue_data_visual, global.dialogue_index);
        var displayed_text = string_copy(dialogue, 1, min(global.dialogue_timer / global.dialogue_speed, string_length(dialogue)));
        
        // 대사창 그리기
        var text_x = 50;
        var text_y = display_get_gui_height() - 100;
        var bubble_width = display_get_gui_width() - 100;
        var bubble_height = 50;
        
        draw_rectangle_color(text_x, text_y, text_x + bubble_width, text_y + bubble_height, c_white, c_white, c_white, c_white, false);
        draw_text(text_x + 10, text_y + 10, displayed_text);
        
        if (global.dialogue_timer / global.dialogue_speed >= string_length(dialogue)) {
            global.dialogue_complete = true;
        } else {
            global.dialogue_timer += 1;
        }

        // 대화가 끝났을 때
        if (global.dialogue_complete) {
            global.dialogue_active = false; // 대화 비활성화
            oPlayer.state = "Move"; // 플레이어 상태 이동 가능
        }
    }
}


function draw_balloon_dialogue() {
    if (global.current_dialogue != "" && global.dialogue_mode == "balloon" && global.dialogue_npc != noone) {
        var npc = global.dialogue_npc;
        var dialogue = ds_list_find_value(global.dialogue_data_balloon, global.dialogue_index);
        var displayed_text = string_copy(dialogue, 1, min(global.dialogue_timer / global.dialogue_speed, string_length(dialogue)));
        
        var text_x = npc.x - camera_get_view_x(view_camera[0]); // 카메라 위치 보정
        var text_y = npc.y - 50 - camera_get_view_y(view_camera[0]); // NPC의 머리 위에 위치하도록 설정
        var bubble_width = 200;
        var bubble_height = 50;
        
        // 말풍선 그리기
        draw_rectangle_color(text_x - bubble_width / 2, text_y - bubble_height, text_x + bubble_width / 2, text_y, c_white, c_white, c_white, c_white, false);
        draw_text(text_x - bubble_width / 2 + 10, text_y - bubble_height + 10, displayed_text);
        
        if (global.dialogue_timer / global.dialogue_speed >= string_length(dialogue)) {
            global.dialogue_complete = true;
        } else {
            global.dialogue_timer += 1;
        }

        // 대화가 끝났을 때
        if (global.dialogue_complete) {
            global.dialogue_active = false; // 대화 비활성화
            oPlayer.state = "Move"; // 플레이어 상태 이동 가능
        }
    }
}
*/


