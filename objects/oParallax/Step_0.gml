if !instance_exists(oPlayer) exit;

layer_x("Fartiles", oPlayer.x / 5);
layer_x("FarBackground", (oPlayer.x / 2)- 30);
layer_x("CloudBackground", oPlayer.x / 1.2);

//draw_background_tiled(bg, Player.x / 2.5, 256, true, false);