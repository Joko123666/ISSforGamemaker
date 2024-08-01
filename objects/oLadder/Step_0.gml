
if place_meeting(x, y, oPlayer) && oPlayer.input.up && oPlayer.ladder_term <= 0 && oPlayer.state == "Move"
{
	oPlayer.state = "Ladder";
	oCamera.camera_yspeed = 2;
	oPlayer.x = x;
	oPlayer.jumpcount = 1;
	oPlayer.ladder_term = 15;
}
if place_meeting(x, y, oPlayer) && oPlayer.input.down && oPlayer.ladder_term <= 0 && oPlayer.state == "Move"
{
	oPlayer.state = "Ladder";
	oCamera.camera_yspeed = 2;
	oPlayer.x = x;
	oPlayer.jumpcount = 1;
	oPlayer.ladder_term = 15;
}