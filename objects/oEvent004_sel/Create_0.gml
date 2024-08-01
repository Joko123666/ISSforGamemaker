

act_count = 0;
deactivate_count = 0;

diafalse_count = 0;
dialog_count = 0;
dialog_endswitch = false;

act_count = 0;
deactivate_count = 10;

//플
oPlayer.state = "Stay";

var file = file_text_open_read(working_directory + "Mainstream_dialog.txt");
for (var i = 0; i < 180; i++;)
{
	text[i] = file_text_read_string(file);
	file_text_readln(file);
}
file_text_close(file);

state = "Stand";

text_start = 46;
text_end = 47;

op_border = 8;
op_space = 64;

pos = 0;

for (var i = 0; i < text_end - text_start +1; i++)
{
	option[i] = text[text_start + i];
}

op_length = array_length(option);
menu_level = 0;

width = 156 ;
height = op_length*op_space +op_border*2;

