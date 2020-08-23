//window_set_size(1280,720)

if instance_exists(intro_controller) {
	exit;	
}

if instance_exists(o_close_transition) {
		yoffset_all = lerp(yoffset_all,250,.4);
}else{ 
		yoffset_all = lerp(yoffset_all,0,.1);	
}


draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var w = 32;
var h = 32;

draw_set_font(f_kenny);

var max_size = tile_size*10;

var vm = matrix_get(matrix_view);
var _cm = matrix_build( display_get_gui_width()-blocks_w/2*tile_size-tile_size/2,  display_get_gui_height()/2-blocks_h/2*tile_size-tile_size/2,
	0, 0, 0, 0, .8, .8, 1);
matrix_set(matrix_view,matrix_multiply(vm,_cm));

var _yoff;

for(var xx = 0; xx < blocks_w ; xx++){
	for(var yy = 0; yy < blocks_h ; yy++){
		_yoff = sin(xx+current_time*0.001);
		draw_sprite_ext(s_grid, 0, xx*tile_size, yy*tile_size+_yoff+yoffset_all,1,1,0,c_white,.5);
		if blocks[xx][yy] != -1{
			if blocks[xx][yy].x != 0 or blocks[xx][yy].y != 0 {
				
				/*if blocks[xx][yy].timer <= elastic_time{
					blocks[xx][yy].x = easings(default_easing,blocks[xx][yy].xbefore,blocks[xx][yy].xchange,elastic_time,blocks[xx][yy].timer);
					blocks[xx][yy].y = easings(dsefault_easing,blocks[xx][yy].ybefore,blocks[xx][yy].ychange,elastic_time,blocks[xx][yy].timer);
					blocks[xx][yy].timer++;
				}*/
				if blocks[xx][yy].blockType != global.Rules.Solid{
					blocks[xx][yy].x = lerp ( blocks[xx][yy].x, 0,.4);
					blocks[xx][yy].y = lerp ( blocks[xx][yy].y, 0,.4);
				}else{
					blocks[xx][yy].x = 0;
					blocks[xx][yy].y = 0;
				}
			}			
			draw_sprite_ext(blocks[xx][yy].sprite, 0, xx*tile_size+3+blocks[xx][yy].x, yy*tile_size+_yoff+3+blocks[xx][yy].y+yoffset_all,1,1,0,c_black,.6);
		}
	}
}

_yoff = sin(player_grid_position.x+current_time*0.001);
_xoff = 5;
player_grid_position.draw_x = lerp(player_grid_position.draw_x,0,.4);
player_grid_position.draw_y = lerp(player_grid_position.draw_y,0,.4);
draw_sprite_ext(s_block_player_control,0,player_grid_position.x*tile_size+3+player_grid_position.draw_x,player_grid_position.y*tile_size+_yoff+3+player_grid_position.draw_y+yoffset_all,1,1,0,c_black,.6);

for(var xx = 0; xx < blocks_w ; xx++){
	for(var yy = 0; yy < blocks_h ; yy++){
		_yoff = sin(xx+current_time*0.001);
		if blocks[xx][yy] != -1{
			//	if blocks[x][y].timer = 0;
			draw_sprite(blocks[xx][yy].sprite, 
			0,xx*tile_size+blocks[xx][yy].x, 
			yy*tile_size+_yoff+blocks[xx][yy].y+yoffset_all);
		}
	}
}

shader_set(sha_dotted);
shader_set_uniform_f(u_time, current_time);

shader_set_uniform_f(u_texel, texW, texH);
shader_set_uniform_f(u_uv, texUv[0], texUv[1], texUv[2], texUv[3]);

for(var xx = 0; xx < blocks_w ; xx++){
	for(var yy = 0; yy < blocks_h ; yy++){
		_yoff = sin(xx+current_time*0.001);
		if blocks[xx][yy] != -1{
			//	if blocks[x][y].timer = 0;
			if blocks[xx][yy].blockType = global.Rules.Statement && blocks[xx][yy].rules != undefined{
				
				if blocks[xx][yy].rules[0] != undefined{
					draw_sprite(s_block_solid, 
					0,xx*tile_size+blocks[xx][yy].x, 
					yy*tile_size+_yoff+yoffset_all+blocks[xx][yy].y);
					draw_sprite(s_block_solid, 
					0,(xx-1)*tile_size+blocks[xx][yy].x, 
					yy*tile_size+sin(xx-1+current_time*0.001)+yoffset_all+blocks[xx][yy].y);
					draw_sprite(s_block_solid, 
					0,(xx+1)*tile_size+blocks[xx][yy].x, 
					yy*tile_size+sin(xx+1+current_time*0.001)+yoffset_all+blocks[xx][yy].y);
				}
				
				if blocks[xx][yy].rules[1] != undefined{
					draw_sprite(s_block_solid, 
					0,xx*tile_size+blocks[xx][yy].x, 
					yy*tile_size+_yoff+yoffset_all+blocks[xx][yy].y);
					draw_sprite(s_block_solid, 
					0,xx*tile_size+blocks[xx][yy].x, 
					(yy-1)*tile_size+_yoff+yoffset_all+blocks[xx][yy].y);
					draw_sprite(s_block_solid, 
					0,xx*tile_size+blocks[xx][yy].x, 
					(yy+1)*tile_size+_yoff+yoffset_all+blocks[xx][yy].y);
				}
			}
			
		}
	}
}
shader_reset();

gpu_set_tex_filter(true);

for(var xx = 0; xx < blocks_w ; xx++){
	for(var yy = 0; yy < blocks_h ; yy++){
		_yoff = sin(xx+current_time*0.001);
		if blocks[xx][yy] != -1{
			
			//	if blocks[x][y].timer = 0;
			draw_text_transformed_color(xx*tile_size+tile_size/2+blocks[xx][yy].x, yy*tile_size+tile_size/2+_yoff+blocks[xx][yy].y+yoffset_all, blocks[xx][yy].name, 
			.2, .2, 
			0
			,c_black,c_black,c_black,c_black,1);
			
		}else{
	//	draw_text_transformed_color(xx*tile_size+tile_size/2, yy*tile_size+tile_size/2+yoffset_all,
		//string(xx)+" "+string(yy),.2, .2, 
	//	0
		//,c_black,c_black,c_black,c_black,1);
		}
	}
}

gpu_set_tex_filter(false);


_yoff = sin(player_grid_position.x+current_time*0.001);
draw_sprite(s_block_player_control,0,player_grid_position.x*tile_size+player_grid_position.draw_x,player_grid_position.y*tile_size+_yoff+player_grid_position.draw_y+yoffset_all);


if o_input.up_pressed  {
		//block_push = function(blocks, x,y,x_add,y_add){
		var s = block_push(blocks,player_grid_position.x,player_grid_position.y-1,
		0,-1,block_push  );
	
		if s = 1 || s = -1 { 
			
				player_grid_position.timer = 0;
				player_grid_position.draw_y = 1*tile_size;
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
			player_grid_position.timer =0;
			player_grid_position.draw_y = -1*tile_size;
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
		
		player_grid_position.timer =0;
		player_grid_position.draw_x = 1*tile_size;
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
		player_grid_position.timer =0;
		player_grid_position.draw_x = -1*tile_size;
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
