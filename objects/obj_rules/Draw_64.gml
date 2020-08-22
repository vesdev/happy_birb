//if live_call() return live_result;
//window_set_size(1280,720)


draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var w = 32;
var h = 32;

draw_set_font(f_kenny);

var tile_size = 20;
var max_size = tile_size*10;

var vm = matrix_get(matrix_view);
var _cm = matrix_build( display_get_gui_width()-blocks_w/2*tile_size-tile_size/2,  display_get_gui_height()/2-blocks_h/2*tile_size-tile_size/2,
	0, 0, 0, 0, .8, .8, 1);
matrix_set(matrix_view,matrix_multiply(vm,_cm));

var _yoff;

for(var xx = 0; xx < blocks_w ; xx++){
	for(var yy = 0; yy < blocks_h ; yy++){
		_yoff = sin(xx+current_time*0.001);
		draw_sprite_ext(s_grid, 0, xx*tile_size, yy*tile_size+_yoff,1,1,0,c_white,.5);
		if blocks[xx][yy] != -1{
			draw_sprite_ext(blocks[xx][yy].sprite, 0, xx*tile_size, yy*tile_size+_yoff+5,1,1,0,c_black,.6);
		}
	}
}

_yoff = sin(player_grid_position.x+current_time*0.001);
draw_sprite_ext(s_ui_sprite,0,player_grid_position.x*tile_size,player_grid_position.y*tile_size+_yoff+5,1,1,0,c_black,.6);

for(var xx = 0; xx < blocks_w ; xx++){
	for(var yy = 0; yy < blocks_h ; yy++){
		_yoff = sin(xx+current_time*0.001);
		if blocks[xx][yy] != -1{
			draw_sprite(blocks[xx][yy].sprite, 0, xx*tile_size, yy*tile_size+_yoff);
			draw_text_transformed_color(xx*tile_size+tile_size/2, yy*tile_size+tile_size/2+_yoff, blocks[xx][yy].name, 
			.2, .2, 
			0
			,c_black,c_black,c_black,c_black,1);
		}	
	}
}
_yoff = sin(player_grid_position.x+current_time*0.001);
draw_sprite(s_ui_sprite,0,player_grid_position.x*tile_size,player_grid_position.y*tile_size+_yoff);


if o_input.up_pressed  {
		//block_push = function(blocks, x,y,x_add,y_add){
		var s = block_push(blocks,player_grid_position.x,player_grid_position.y-1,
		0,-1,block_push  );
	
		if s = 1 || s = -1 { 
				player_grid_position.y -= 1;
				
		if s != -1 {
			var C = updateRules(blocks,allRules);
			if C > prevRules {
				audio_play_sound(snd_rule, 0, false);
				prevRules = C;
			}else if C < prevRules{
				audio_play_sound(snd_rule_down, 0, false);
				prevRules = C;
			}
			audio_play_sound(snd_push, 0, false);
			
		}else{
			audio_play_sound(snd_move, 0, false);
		}
	}
}
	
if o_input.down_pressed  {
	var s = block_push(blocks,player_grid_position.x,player_grid_position.y+1,
	0,1,block_push  );
	if s = 1 || s = -1 { 
			player_grid_position.y += 1;
			
		if s != -1 {
			var C = updateRules(blocks,allRules);
			if C > prevRules {
				audio_play_sound(snd_rule, 0, false);
				prevRules = C;
			}else if C < prevRules{
				audio_play_sound(snd_rule_down, 0, false);
				prevRules = C;
			}
			audio_play_sound(snd_push, 0, false);
		}else{
			audio_play_sound(snd_move, 0, false);
		}


	}
}
if o_input.left_pressed  {
	var s = block_push(blocks,player_grid_position.x-1,player_grid_position.y,
	-1,0,block_push )
		if s = 1 || s = -1 { 
		
		player_grid_position.x -= 1;
	
		if s != -1 {
			var C = updateRules(blocks,allRules);
			if C > prevRules {
				audio_play_sound(snd_rule, 0, false);
				prevRules = C;
			}else if C < prevRules{
				audio_play_sound(snd_rule_down, 0, false);
				prevRules = C;
			}
			audio_play_sound(snd_push, 0, false);
		}else{
			audio_play_sound(snd_move, 0, false);
		}


	}
}
if o_input.right_pressed  {
	var s = block_push(blocks,player_grid_position.x+1,player_grid_position.y,
	1,0,block_push  )
	if s = 1 || s = -1 { 
		player_grid_position.x += 1;	
	
		if s != -1 {
			var C = updateRules(blocks,allRules);
			if C > prevRules {
				audio_play_sound(snd_rule, 0, false);
				prevRules = C;
			}else if C < prevRules{
				audio_play_sound(snd_rule_down, 0, false);
				prevRules = C;
			}
			audio_play_sound(snd_push, 0, false);
		}else{
			audio_play_sound(snd_move, 0, false);
		}
	}
}



player_grid_position.x = clamp( player_grid_position.x,0,blocks_w-1);
player_grid_position.y = clamp( player_grid_position.y,0,blocks_h-1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

matrix_set(matrix_view,vm);
