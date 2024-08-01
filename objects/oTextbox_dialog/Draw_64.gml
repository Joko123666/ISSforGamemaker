
//textbox_x = camera_get_view_x(view_camera[camera_num]);
//textbox_y = camera_get_view_y(view_camera[camera_num]);


textbox_x = display_get_gui_width()*1/8 + sprite_get_width(sprite_set);
textbox_y = display_get_gui_height()/7;
imagebox_x = display_get_gui_width()/8;

//setup
if setup == false
{
	setup = true;
	draw_set_font(Font01);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	
	//loop throught the page
	page_num = array_length(text);
	for(var p = textline_start; p < textline_end + 1; p++)
	{
		//find how many characters in each page and store
		text_length[p] = string_length(text[p]);
		
		text_x_offset[p] = 0;
		
	}
	
}

//typing the text
if draw_char < text_length[page]
{
	draw_char += text_spd;
	draw_char = clamp(draw_char, 0, text_length[page]);
}


//flip through pages
if oGame.input.interaction
{
	//if the type is done
	if draw_char == text_length[page]
	{
		//next_page
		if page < textline_end
		{
			page++;
			draw_char = 0;
			audio_play_sound(sound_set, 1, 0);
		}
		//destroy textbox
		else
		{
			instance_destroy();
			oPlayer.state = "Move";
			oNPC_death.act_count = 10;
		}
	}
	//if type is done
	else
	{
		draw_char = text_length[page];
	}

}

//draw_textbod
textbox_img += textbox_img_spd;
textbox_spr_w = sprite_get_width(textbox_spr);
textbox_spr_h = sprite_get_height(textbox_spr);
//back of sprite
draw_sprite_ext(textbox_spr, textbox_img, textbox_x + text_x_offset[page], textbox_y, textbox_width/textbox_spr_w, textbox_height/textbox_spr_h, 0, c_white, 1);

//draw the text
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(textbox_x + text_x_offset[page] + border, textbox_y + border, _drawtext, line_sep, line_width);

//draw sprite
draw_sprite(sprite_set, 0, imagebox_x, textbox_y - 8);