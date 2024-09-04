
depth = -999;

camera_num = 0;

textbox_width = display_get_gui_width();
textbox_height = display_get_gui_height()/7;
border = 24;
line_sep = 32;
line_width = textbox_width - border*2;
textbox_spr = dialog_box;
textbox_img = 2;
textbox_img_spd = 0;

textline_start = 1;
textline_end = 2;

//종료시 대화진행도 설정
progress_set = 0;

//이미지 파일 세팅
sprite_set = System_picture;
image_num = 0;
//대화 출력 사운드 세팅
sound_set = SE_system01;
//이름 설정
draw_name = "empty";
//color
textcol = c_black;

setup = false;

//the text
page = textline_start;
page_num = 0;

//텍스트 파일 호출
	var file = file_text_open_read(working_directory + "Mainstream_dialog.txt");
	var _text = "";
	for (var i = 0; i < 180; i++;)
	{
	    var _raw_text = "";
	    text[i] = file_text_read_string(file);
		_raw_text = text[i];
		var _processed_text = replace_player_name(_raw_text);
		text[i] = _processed_text;
	    file_text_readln(file);
	}
	file_text_close(file);


text_length[0] = string_length(text[0]);
draw_char = 0;
text_spd = 1;


