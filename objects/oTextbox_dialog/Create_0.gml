
depth = -999;

camera_num = 0;

textbox_width = display_get_gui_width()*5/8;
textbox_height = display_get_gui_height()/7;
border = 24;
line_sep = 32;
line_width = textbox_width - border*2;
textbox_spr = UI_textbox2;
textbox_img = 0;
textbox_img_spd = 1;

textline_start = 1;
textline_end = 2;

//종료시 게임진행도 설정
game_progress_set = 0;

//the text
page = textline_start;
page_num = 0;

//텍스트 파일 호출
	var file = file_text_open_read(working_directory + "NPC_dialog.txt");
	for (var i = 1; i < 80; i++;)
	{
	    text[i] = file_text_read_string(file);
	    file_text_readln(file);
	}
	file_text_close(file);

text_length[0] = string_length(text[0]);
draw_char = 0;
text_spd = 1;

//이미지 파일 세팅
sprite_set = sDialog_image;
//대화 출력 사운드 세팅
sound_set = SE_system01;

setup = false;

