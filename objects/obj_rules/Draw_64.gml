
//window_set_size(1280,720)
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var w = 32;
var h = 32;
sprite_set_live(s_grid,1);
sprite_set_live(s_ui_sprite,1);

draw_set_font(f_kenny);

var tile_size = 20;
var max_size = tile_size*10;

for(var xx = 0; xx < blocks_w ; xx++){
	for(var yy = 0; yy < blocks_h ; yy++){
		draw_sprite(s_grid, 0, xx*tile_size, yy*tile_size);
			
		if blocks[xx][yy] != -1{
			draw_sprite(blocks[xx][yy].sprite, 0, xx*tile_size, yy*tile_size);
			
			draw_text_transformed_color(xx*tile_size+tile_size/2, yy*tile_size+tile_size/2, blocks[xx][yy].name, 
			.2, .2, 
			0
			,c_black,c_black,c_black,c_black,1);
		}	
		draw_sprite(s_ui_sprite,0,player_grid_position.x*tile_size,player_grid_position.y*tile_size);
	}
}

if o_input.up_pressed  {
	
	//block_push = function(blocks, x,y,x_add,y_add){
	var s = block_push(blocks,player_grid_position.x,player_grid_position.y-1,
	0,-1 )
	

	if s { 

	player_grid_position.y -= 1;
	
	updateRules(blocks,allRules);
	}
}
	
if o_input.down_pressed  {
	var s = block_push(blocks,player_grid_position.x,player_grid_position.y+1,
	0,1 )
	if s { 
	updateRules(blocks,allRules);
	player_grid_position.y += 1;
	}
}
if o_input.left_pressed  {
	var s = block_push(blocks,player_grid_position.x-1,player_grid_position.y,
	-1,0 )
	if s { 
	updateRules(blocks,allRules);
	player_grid_position.x -= 1;
	}
}
if o_input.right_pressed  {
	var s = block_push(blocks,player_grid_position.x+1,player_grid_position.y,
	1,0 )
	if s { 
	updateRules(blocks,allRules);
	player_grid_position.x += 1;
	}
}




player_grid_position.x = clamp( player_grid_position.x,0,blocks_w-1);
player_grid_position.y = clamp( player_grid_position.y,0,blocks_h-1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);