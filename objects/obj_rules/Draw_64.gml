if live_call() return live_result;

//window_set_size(1280,720)
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var w = 32;
var h = 32;

draw_set_font(f_kenny_blocks);
var tile_size = 16;
var max_size = tile_size*10;

for(var xx = 0; xx < blocks_w ; xx++){
	for(var yy = 0; yy < blocks_h ; yy++){
			draw_line(xx*tile_size,0,xx*tile_size,max_size);
			draw_line(0,yy*tile_size,max_size,yy*tile_size);
		if blocks[xx][yy] != -1{
			draw_sprite(blocks[xx][yy].sprite, 0, xx*tile_size, yy*tile_size);
			
			draw_text_transformed(xx*tile_size+tile_size/2, yy*tile_size+tile_size/2, blocks[xx][yy].name, .5, .5, 0);
		
		}		
		

		draw_sprite(s_ui_sprite,0,player_grid_position.x*tile_size,player_grid_position.y*tile_size);
	}
}

if o_input.up_pressed  {
	
	player_grid_position.y -= 1;
}

if o_input.down_pressed  {
	
	player_grid_position.y += 1;
}

if o_input.left_pressed  {
	
	player_grid_position.x -= 1;
}

if o_input.right_pressed  {
	player_grid_position.x += 1;
}


player_grid_position.x = clamp( player_grid_position.x,0,blocks_w);
player_grid_position.y = clamp( player_grid_position.y,0,blocks_h);



draw_set_halign(fa_left);
draw_set_valign(fa_top);