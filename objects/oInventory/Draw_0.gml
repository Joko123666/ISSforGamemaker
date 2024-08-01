// oInventory 그리기 이벤트
if instance_exists(oPlayer)
{draw_text(oPlayer.x + 128, oPlayer.y + 64, string(state))}
if (state == "Opened") {
    // 아이템 창 그리기
    draw_sprite_stretched(
        sInventory,
        0,
        x - 6,
        y - 6,
        12 + row_length * 36,
        12 + (((INVENTORY_SLOTS - 1) div row_length) + 1) * 36
    );
    // 아이템 스프라이트 정렬, 그리기
    for (var i = 0; i < INVENTORY_SLOTS; i++) {
        var xx = x + (i mod row_length) * 36 + 2;
        var yy = y + (i div row_length) * 36 + 2;
        var hover = (oMouse.inventory_hover == id) && (oMouse.slot_hover == i);
        // 일정 간격으로 슬롯창(빈칸) 그리기
        draw_sprite(sSlot, hover, xx, yy);
        // 슬롯이 채워져 있는 경우
        if (inventory[i] != -1) {
            var alpha = 1.0;
            // 아이템 드로우
            draw_sprite(sItems, inventory[i], xx, yy);
            draw_set_alpha(1.0);
        }
        // 선택된 슬롯 강조 표시
        if (i == selected_slot) {
            draw_sprite_stretched_ext(UI_box, 3,xx, yy, 32, 32, c_white, 1);
        }
    }
	if (isSwap == true) {
            draw_sprite_stretched_ext(UI_box, 1,x + (original_slot mod row_length) * 36 + 2, y + (original_slot div row_length) * 36 + 2, 32, 32, c_white, 1);
        }
	
	
	if (menu_level == 1)	{
		//draw option
		draw_set_font(Font01);
		draw_set_color(c_dkgray);

		draw_set_valign(fa_top);
		draw_set_halign(fa_center);

		var _x = x + (selected_slot mod row_length) * 36 + 2 + 36;
		var _y = y + (selected_slot div row_length) * 36 + 2;

		//매뉴 전체 배경 그리기
		draw_sprite_stretched(UI_box, 9, _x, _y, width, height);

		//draw_text
		for (i = 0; i < op_length; i++)
		{
			var _c = c_white;
			if (pos == i) {_c = c_yellow}
			draw_sprite_stretched(UI_box, 10, _x + op_border, (_y+op_border+op_space*i), width - op_border*2, op_space - 4);
			draw_text_color(_x+width/2, _y+op_border*2+op_space*i, option[menu_level, i], _c, _c, _c, _c, 1);
		}
	}
}
