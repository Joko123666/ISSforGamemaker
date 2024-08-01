// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_textbox(dialog, dialog_count, color, SE)
{

var text = instance_create_layer(x, y-62, "Effects", text_drawingob);
	text.text = dialog(dialog_count);
	text.box_color = color;
	//중앙으로 정렬
	var text_width = string_width(text.text);
	text.x -= text_width/2 + 4;
	
	audio_play_sound(SE, 1, false);
}