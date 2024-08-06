


if place_meeting(x,y,oPlayer) && act_count <= 0
{
	if x < oPlayer.x 
	{image_xscale = 1;}
	else if x > oPlayer.x 
	{image_xscale = -1;}
}

// oNPC_test02 Step 이벤트
if (keyboard_check_pressed(ord("E")) && distance_to_object(oPlayer) < 32 && !global.dialogue_active) {
    if (global.interaction_delay <= 0) {
        global.dialogue_mode = "balloon";
        global.current_dialogue = "NPC_dialog";
        global.dialogue_index = irandom_range(9, 19); // 10~20번째 줄을 랜덤으로 선택
        global.dialogue_timer = 0;
        global.dialogue_complete = false;
        global.dialogue_npc = id; // 현재 대화 중인 NPC 설정
        global.interaction_delay = room_speed / 2; // 0.5초 딜레이
        global.dialogue_active = true; // 대화 활성화 플래그 설정
        oPlayer.state = "Stay"; // 플레이어 상태 고정
    }
}




act_count = count_decrease(act_count, 1, 0);