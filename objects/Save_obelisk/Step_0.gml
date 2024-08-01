// Save_obelisk Step 이벤트
if (keyboard_check_pressed(ord("E")) && distance_to_object(oPlayer) < 32) && state == "deactive"
{
    if (global.interaction_delay <= 0) {
        global.save_menu_open = true;
        global.interaction_delay = room_speed / 2; // 0.5초 딜레이
		oPlayer.state = "Stay";
    }
	state = "active";
}

update_save_menu();
