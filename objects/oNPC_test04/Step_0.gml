


if place_meeting(x,y,oPlayer) && act_count <= 0
{
	if x < oPlayer.x 
	{image_xscale = 1;}
	else if x > oPlayer.x 
	{image_xscale = -1;}
}

// oMainstream_NPC Step 이벤트
if (keyboard_check_pressed(ord("E")) && distance_to_object(oPlayer) < 32 && !global.dialogue_active) {
    if (global.interaction_delay <= 0) {
        global.dialogue_mode = "visual";
        global.current_dialogue = "Mainstream_dialog";
        global.dialogue_index = dialogue_lines; // 현재 줄로 설정
        global.dialogue_timer = 0;
        global.dialogue_complete = false;
        global.dialogue_npc = id; // 현재 대화 중인 NPC 설정
        global.interaction_delay = room_speed / 2; // 0.5초 딜레이
        global.dialogue_active = true; // 대화 활성화 플래그 설정
        oPlayer.state = "Stay"; // 플레이어 상태 고정
        dialogue_lines += 1; // 다음 줄로 이동
        if (dialogue_lines > 24) {
            dialogue_lines = 16; // 25번째 줄 이후 다시 16번째 줄로 순환
        }
    }
}


if act_count > 0 
	{ act_count--;}