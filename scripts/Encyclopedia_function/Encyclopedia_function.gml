// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Encyclopedia_set()
{
	for(var i = 0; i < 100; i++)
	{
		for (var j = 0; j <10; j++)
		{
			global.Encyclopedia[j][i] = {num : i, name : "", explanation : "", count : 0};
		}
	}
	//0 = 채집 , 1 = 장비 , 2 = 키 , 3 = 도서
	
	global.Encyclopedia[0][0] = {name : "상한열매", explanation : "나무에 매달린채로 물러서 비틀어진 열매. 길드에서 거름용으로 싸게 매입해준다.", count : 0};
	global.Encyclopedia[0][1] = {name : "브아" , explanation : "베어물면 아삭한 식감과 함께 달콤한 즙이 흘러나오는 과일, 희소성은 없지만 모두가 좋아한다.", count : 0}; 
	global.Encyclopedia[0][2] = {name : "즈도아두" , explanation : "새콤달콤한 열매, 가끔씩 지독하게 신 개체가 섞여있기도 하지만 그럼에도 손이 갈만큼 맛있다.", count : 0}; 
	global.Encyclopedia[0][3] = {name : "바츠이" , explanation : "쌍으로 자라나는 보라색 과실, 맛보다는 희소성떄문에 가격이 붙은 케이스. 물론 이것을 가장 좋아하는 사람 또한 많다.", count : 0}; 
	global.Encyclopedia[0][4] = {name : "홍옥" , explanation : "새빨갛고 살짝 시큼한 향과 놀랍도록 진한 단맛을 내는 과실, 금방 상하기 때문에 신선한 녀석은 비싸게 매매된다.", count : 0}; 
	global.Encyclopedia[0][5] = {name : "회전과" , explanation : "순전 아오. 반전 아카. 무라사키", count : 0}; 
	global.Encyclopedia[0][6] = {name : "66과" , explanation : "", count : 0}; 
	global.Encyclopedia[0][7] = {name : "칠색과" , explanation : "", count : 0}; 
	global.Encyclopedia[0][8] = {name : "팔문과" , explanation : "", count : 0}; 
	global.Encyclopedia[0][9] = {name : "구라과" , explanation : "", count : 0}; 
	global.Encyclopedia[0][10] = {name : "풀뿌리" , explanation : "뿌리를 제하고 윗부분만 뽑혀버린 흔적, 아주 조금 남아있는 부분을 모아 싼 영양제를 만들기도 하기 떄문에 길드가 한꺼번에 매입해준다.", count : 0}; 
	global.Encyclopedia[0][11] = {name : "녹뿌리" , explanation : "가장 흔하게 발견되는 약초 뿌리, 약효는 강하지 않지만 다양하게 사용되기 때문에 항상 수요가 있다.", count : 0}; 
	global.Encyclopedia[0][12] = {name : "적뿌리" , explanation : "흔하게 발견되는 약초 뿌리, 사용법은 으깨서 녹뿌리와 합치면 약효를 상승시켜주는것이 가장 잘 알려져있다.", count : 0}; 
	global.Encyclopedia[0][13] = {name : "마삼" , explanation : "먹으면 몸에 참 좋다고 하는 약초, 약초의 대명사중 하나로 순수하게 몸의 힘을 끌어올리는데에 많이 사용된다.", count : 0}; 
	global.Encyclopedia[0][14] = {name : "태극뿌리" , explanation : "적색과 청색이 합쳐져서 최강으로 보이는 뿌리, 으깨기만 해도 단독으로 효과가 나오는 약초며 혼합하면 더욱 좋은 약을 만들 수 있어 비싸게 매입된다.", count : 0}; 
	global.Encyclopedia[0][15] = {name : "만드라고라" , explanation : "식물형태의 마물의 대표격중 하나, 하지만 마물답지 않게 인간을 공격하지 않고 땅속에서 영양분을 흡수하는데 모든 힘을 다하며 지상에 나왔을때는 포기하고 죽을때까지 한가지 포즈를 잡는 생태를 가지고 있다.", count : 0}; 
	global.Encyclopedia[0][20] = {name : "잔가지" , explanation : "", count : 0}; 
	global.Encyclopedia[0][21] = {name : "마가지" , explanation : "", count : 0}; 
	global.Encyclopedia[0][22] = {name : "목편" , explanation : "", count : 0}; 
	global.Encyclopedia[0][23] = {name : "목재" , explanation : "", count : 0}; 
	global.Encyclopedia[0][24] = {name : "마편" , explanation : "", count : 0}; 
	global.Encyclopedia[0][25] = {name : "마옹이" , explanation : "", count : 0}; 
	global.Encyclopedia[0][30] = {name : "혼석" , explanation : "", count : 0}; 
	global.Encyclopedia[0][31] = {name : "철광석" , explanation : "", count : 0}; 
	global.Encyclopedia[0][32] = {name : "청옥" , explanation : "", count : 0}; 
	global.Encyclopedia[0][33] = {name : "녹옥" , explanation : "", count : 0}; 
	global.Encyclopedia[0][34] = {name : "자주옥" , explanation : "", count : 0}; 
	global.Encyclopedia[0][35] = {name : "마광석" , explanation : "", count : 0}; 
	global.Encyclopedia[0][40] = {name : "독버섯" , explanation : "", count : 0}; 
	global.Encyclopedia[0][41] = {name : "곰보버섯" , explanation : "", count : 0}; 
	global.Encyclopedia[0][42] = {name : "녹편버섯" , explanation : "", count : 0}; 
	global.Encyclopedia[0][43] = {name : "적주버섯" , explanation : "", count : 0}; 
	global.Encyclopedia[0][44] = {name : "청광버섯" , explanation : "", count : 0}; 
	global.Encyclopedia[0][45] = {name : "알버섯" , explanation : "", count : 0}; 
	global.Encyclopedia[0][50] = {name : "" , explanation : "", count : 0}; 
	
}

function next_encyclopedia_page() {
    global.encyclopedia_page = (global.encyclopedia_page + 1) % global.total_encyclopedia_pages;
}

function previous_encyclopedia_page() {
    global.encyclopedia_page -= 1;
    if (global.encyclopedia_page < 0) {
        global.encyclopedia_page = global.total_encyclopedia_pages - 1;
    }
}

function draw_encyclopedia() {
    var page_start = global.encyclopedia_page * global.encyclopedia_items_per_page;
    var page_end = min(page_start + global.encyclopedia_items_per_page, global.encyclopedia_length);
    
    var menu_x = 60;
    var menu_y = 40;
    var menu_width = display_get_gui_width() - 120;
    var menu_height = display_get_gui_height() - 80;
    var menu_border = 10;
    var menu_space = 44;
    
    // 메뉴 전체 배경 그리기
    draw_sprite_stretched(UI_box, 8, menu_x, menu_y, menu_width, menu_height);
    
    for (var i = page_start; i < page_end; i++) {
        var _c = c_white;
        if (pos == i) {_c = c_yellow}
        var _check_count = global.Encyclopedia[0][i].count;
        
        // 아이템 이름
        draw_sprite_stretched(UI_box, 3, menu_x + menu_border * 3 - 6, menu_y + menu_border * 2 + menu_space * (i - page_start) - 4, menu_border * 8, menu_space / 2);
        if (_check_count > 0) {
            draw_text_color(menu_x + menu_border * 3, menu_y + menu_border * 2 + menu_space * (i - page_start), global.Encyclopedia[0][i].name, _c, _c, _c, _c, 1);
        } else {
            draw_text_color(menu_x + menu_border * 3, menu_y + menu_border * 2 + menu_space * (i - page_start), "???", _c, _c, _c, _c, 1);
        }
        // 아이템 번호
        draw_text_color(menu_x + menu_border - 8, menu_y + menu_border * 2 + menu_space * (i - page_start), string(i) + ".", _c, _c, _c, _c, 1);
    }
    
    var _check_count = global.Encyclopedia[0][pos].count;
    // 아이템 이미지 박스
    draw_sprite_stretched(UI_box, 1, menu_x + menu_border * 11 - 2, menu_y + menu_border * 2 - 2, 68, 68);
    if (_check_count > 0) {
        // 아이템 설명
        draw_text_color(menu_x + menu_border * 17, menu_y + menu_border * 2, global.Encyclopedia[0][pos].explanation, c_black, c_black, c_black, c_black, 1);
        // 아이템 이미지
        draw_sprite_ext(sItems, pos, menu_x + menu_border * 11, menu_y + menu_border * 2, 2, 2, 0, c_white, 1);
        // 아이템 획득 갯수
        draw_text(menu_x + menu_border * 11, menu_y + menu_border * 6, "획득 수 : " + string(global.Encyclopedia[0][pos].count));
    }

    // 페이지 넘기기 텍스트
    draw_text(menu_x, menu_y + menu_height - 20, "Page " + string(global.encyclopedia_page + 1) + " / " + string(global.total_encyclopedia_pages));
}

