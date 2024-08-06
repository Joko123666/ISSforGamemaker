


if place_meeting(x,y,oPlayer) && act_count <= 0
{
	if x < oPlayer.x 
	{image_xscale = 1;}
	else if x > oPlayer.x 
	{image_xscale = -1;}
}

// oNPC_test05 Step 이벤트
if (keyboard_check_pressed(ord("E")) && distance_to_object(oPlayer) < 32) &&act_count <= 0
{
	if (global.interaction_delay <= 0) {
	  // 퀘스트를 수주한 적이 있는지 확인
        var quest_id = 1;
        var quest_found = false;

        for (var i = 0; i < ds_list_size(global.quests); i++) {
            var quest = ds_list_find_value(global.quests, i);
            if (quest[? "id"] == quest_id) {
                quest_found = true;
                break;
            }
        }

        if (!quest_found) {
            // 퀘스트 수주
            var new_quest = create_quest(quest_id, "Find Item", "Bring back item with ID 1", 1);
            add_quest(new_quest);
			//텍스트 박스
			create_textbox_popup("Quest를 수주 하시겠습니까?", c_ltgray, c_black);
			audio_play_sound(SE_dialog_m01, 1, false);
        } 
		else {
            // 퀘스트 진행 확인 및 아이템 제거
            if (remove_item_by_id(oInventory, 1)) {
                update_quest_progress(quest_id, 1);
            }
        }

        global.interaction_delay = room_speed / 2; // 0.5초 딜레이 
		act_count = 120;
	}
}




act_count = count_decrease(act_count, 1, 0);