/// @description 게임 재시작

restart_count--;
if restart_count <= 0
{
	restart_count = 60;
	game_restart();
}
