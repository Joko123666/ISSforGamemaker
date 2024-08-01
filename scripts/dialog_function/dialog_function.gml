
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