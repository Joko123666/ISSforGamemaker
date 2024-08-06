function create_quest(id, name, description, goal) {
    var quest = ds_map_create();
    quest[? "id"] = id;
    quest[? "name"] = name;
    quest[? "description"] = description;
    quest[? "goal"] = goal;
    quest[? "progress"] = 0;
    return quest;
}

function add_quest(quest) {
    if (ds_list_size(global.quests) < global.quest_max) {
        ds_list_add(global.quests, quest);
        show_debug_message("Quest added: " + quest[? "name"]);
    } else {
        show_debug_message("Quest list is full.");
    }
}

function update_quest_progress(quest_id, progress) {
    for (var i = 0; i < ds_list_size(global.quests); i++) {
        var quest = ds_list_find_value(global.quests, i);
        if (quest[? "id"] == quest_id) {
            quest[? "progress"] += progress;
            if (quest[? "progress"] >= quest[? "goal"]) {
                quest[? "progress"] = quest[? "goal"];
                show_debug_message("Quest completed: " + quest[? "name"]);
            }
            return true; // 진행 상황 업데이트 성공
        }
    }
    show_debug_message("Quest not found: " + string(quest_id));
    return false; // 퀘스트를 찾지 못함
}

function draw_quests() {
    var _x = 60;
    var _y = 40;
    var spacing = 30;

    draw_text(_x, _y, "Current Quests:");
    _y += spacing;

    for (var i = 0; i < ds_list_size(global.quests); i++) {
        var quest = ds_list_find_value(global.quests, i);
        var quest_text = quest[? "name"] + ": " + string(quest[? "progress"]) + " / " + string(quest[? "goal"]);
        draw_text(_x, _y, quest_text);
        _y += spacing;
    }
}
