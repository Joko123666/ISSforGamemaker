
function stop_BGM()
{
	audio_stop_all();
}

function toPlayer()
{
	x = oPlayer.x;
	y = oPlayer.y;
}

function replace_player_name(text) {
    return string_replace_all(text, "{name}", global.name_player);
}
