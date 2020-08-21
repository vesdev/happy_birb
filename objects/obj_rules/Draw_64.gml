draw_set_halign(fa_center);
draw_set_valign(fa_middle);
for(var i = 0; i < blocks_w ; i++){
	for(var j = 0; j < blocks_h ; j++){
		
		if blocks[i][j] != -1{
			draw_sprite(blocks[i][j].sprite, 0, i*15, j*15);
			draw_text_transformed(i*15, j*15, blocks[i][j].name, .5, .5, 0);
		}
	}
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);