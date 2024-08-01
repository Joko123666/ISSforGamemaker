
var _bgm = BGM_name;

if audio_is_playing(BGM_name)
{instance_destroy();}
else 
{
	stop_BGM();
	audio_play_sound(BGM_name, 1, 1);
	instance_destroy();
}
