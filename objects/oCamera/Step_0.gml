
	width = camera_get_view_width(view_camera[0]);
	height = camera_get_view_height(view_camera[0]);


if !instance_exists(oPlayer) {exit;}
#region Camera_smooth_movement
if room != "Title"
{
	if camera_xmovement_point > camera_xmovement
	{
		camera_xmovement += camera_xspeed
		if camera_xmovement_point <= camera_xmovement
		{
			camera_xmovement = camera_xmovement_point;
		}
	}
	if camera_xmovement_point < camera_xmovement
	{
		camera_xmovement -= camera_xspeed
		if camera_xmovement_point >= camera_xmovement
		{
			camera_xmovement = camera_xmovement_point;
		}
	}
	if camera_ymovement_point > camera_ymovement
	{
		camera_ymovement += camera_yspeed
		if camera_ymovement_point <= camera_ymovement
		{
			camera_ymovement = camera_ymovement_point;
		}
	}
	if camera_ymovement_point < camera_ymovement
	{
		camera_ymovement -= camera_yspeed
		if camera_ymovement_point >= camera_ymovement
		{
			camera_ymovement = camera_ymovement_point;
		}
	}
#endregion

var target_x = oPlayer.x + random_range(-screenshake_x, screenshake_x);
var target_y = oPlayer.y + random_range(-screenshake_y * (3/4), screenshake_y * (3/4));

x = lerp(x, target_x, 0.2);
y = lerp (y, target_y - 104, 0.2);

camera_set_view_pos(view_camera[0], x - width/2 + camera_xmovement, y - height/2 + camera_ymovement);


}