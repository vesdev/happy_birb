
#macro SEC game_get_speed(gamespeed_fps)


elastic_time = SEC*.2;
elastic_change = 0;
elastic_current = 0;
default_easing = e_ease.easeoutelastic;






tile_size = 20;

block_while = new Block("WHILE", global.Rules.Statement, global.Rules.While, s_block_statement);
block_while2 = new Block("WHILE", global.Rules.Statement, global.Rules.While, s_block_statement);

block_whileNot = new Block("WHILE\nNOT", global.Rules.Statement, global.Rules.WhileNot, s_block_statement);
block_whileNot2 = new Block("WHILE\nNOT", global.Rules.Statement, global.Rules.WhileNot, s_block_statement);

block_result_hi = new Block(
	"say\nhi", global.Rules.Result, 
	function(){
		show_debug_message("hi");
	},
	s_block_result
);


event_user(0);


block_result_timeslow = new Block( 
	"Time\nSlow", global.Rules.Result,
	function(){
		global.timeScale = .01;
	},
	 s_block_result
); 

block_result_jump = new Block( 
	 "You\nJump", global.Rules.Result,
	 o_movement_parent.jump,
	 s_block_result
); 

global.canPush = false;
block_result_push_solids = new Block( 
	 "Push\nSolids", global.Rules.Result,
	 function(){
		global.canPush = true;
	},
	 s_block_result
); 

block_touching_ground_condition = new Block(
	"On\nGround", global.Rules.Condition, 
	function(){
		with o_movement_parent {
			return touching_ground;
		}
	},s_block_condition
);


block_condition = new Block(
	"true", global.Rules.Condition, 
	function(){
		return true;
	},
	s_block_condition
);

block_condition_anykey = new Block(
	"any\nkey", global.Rules.Condition, 
	function(){
		return keyboard_check(vk_anykey);
	},
	s_block_condition
);

block_solid = new Block(
	"", global.Rules.Solid, 
	function(){
		return true;
	},
	s_block_solid_dark
);

//set up grid
blocks = [];
blocks_w = 10;
blocks_h = 10;

player_grid_position = { 
	x : 6,
	y :5,
	draw_x : 0,
	draw_y : 0,
	timer : 0,
	xbefore : 0,
	ybefore : 0
}


for(var i = 0; i < blocks_w ; i++){
	blocks[i] = [];
	for(var j = 0; j < blocks_h ; j++){
		blocks[i][j] = -1;
	}
}


allRules = ds_list_create();
prevRules = 0;
updateRules = function(blocks, ruleDsList){
	ds_list_clear(ruleDsList);
	for(var i = 0; i < blocks_w; i++){
		for(var j = 0; j < blocks_h; j++){
			
			if blocks[i][j] != -1{
			
			if  blocks[i][j].rules[0] != undefined{
			delete blocks[i][j].rules[0];
			rules[0] = undefined;
			}
			if  blocks[i][j].rules[1] != undefined{
			delete blocks[i][j].rules[1];
			rules[1] = undefined;
			}
			
			//show_debug_message( blocks[i][j].blockType)
				if  blocks[i][j].blockType != undefined and blocks[i][j].blockType = global.Rules.Statement{
					if i > 0 && i < blocks_w-1{
					
						if blocks[i][j].rules[0] = undefined && 
						(blocks[i-1][j] != -1 && blocks[i+1][j] != -1)&&
						(blocks[i-1][j].blockType = global.Rules.Result && blocks[i+1][j].blockType =
						global.Rules.Condition){
							
							blocks[i][j].rules[0]  = new Rule(
								blocks[i-1][j].func,
								blocks[i+1][j].func,
								blocks[i][j].func
							)
							ds_list_add(ruleDsList, blocks[i][j].rules[0]);
						}
					}	
					
					if j > 0 && j < blocks_h-1{
						if blocks[i][j].rules[1] = undefined && 
							(blocks[i][j-1] != -1 && blocks[i][j+1] != -1) &&
							(blocks[i][j-1].blockType = global.Rules.Result && blocks[i][j+1].blockType =
							global.Rules.Condition){
								
							blocks[i][j].rules[1] = new Rule(
								blocks[i][j-1].func,
								blocks[i][j+1].func,
								blocks[i][j].func
							)
							ds_list_add(ruleDsList, blocks[i][j].rules[1]);
						}
						
					}
				}	
			}	
		}
	}
}
//temporary stuff

switch room { 
	case r_lv_01:
	blocks[3][3] = block_result_right;
	blocks[4][4] = block_while;
	blocks[5][5] = block_touching_ground_condition;
	break;
	
	case r_lv_02:
	
	blocks[5][4] = block_result_right;
	blocks[4][5] = block_while;
	blocks[4][6] = block_touching_ground_condition;
	blocks[3][2] = block_result_jump;
	blocks[2][2] = block_result_left;
	break;
	
	case r_lv_03:

	blocks[5][4] = block_result_right;
	blocks[4][5] = block_while;
	blocks[4][6] = block_touching_ground_condition;
	blocks[3][2] = block_result_jump;
	blocks[2][2] = block_result_left;
	
	blocks[7][8] = block_condition_anytime;
	
	
	break;
	
	case r_lv_04:
	
	
	blocks[5][4] = block_result_right;
	blocks[4][5] = block_while;
	blocks[7][8] = block_touching_ground_condition;
	blocks[3][4] = block_result_jump;
	blocks[4][6] = block_condition_anytime;

	break;
	
	case r_lv_05:
	blocks[5][4] = block_result_right;
	blocks[4][5] = block_while;
	blocks[4][6] = block_touching_ground_condition;
	blocks[3][2] = block_result_jump;
	blocks[7][8] = block_condition_anytime;
	break;
	
	case r_lv_06:
	
	blocks[5][4] = block_result_right;
	blocks[2][3] = block_while;
	blocks[7][2] = block_result_jump;
	blocks[3][6] = block_whileNot;
	blocks[4][6] = block_touching_ground_condition;
	blocks[3][7] = block_solid;
	blocks[4][7] = block_solid;
	blocks[5][6] = block_solid;	
	
	break;
	
	case r_lv_07:
	
	blocks[5][4] = block_result_right;
	blocks[7][2] = block_result_jump;
	blocks[7][7] = block_while;
	blocks[4][6] = block_condition_anykey;
	
	blocks[0][7] = block_solid;
	blocks[2][7] = block_solid;	
	blocks[3][8] = block_solid;	
	blocks[3][9] = block_solid;	
	
	blocks[0][8] = block_result_timeslow;
	blocks[1][8] = block_whileNot;
	blocks[2][8] = block_touching_ground_condition;
	blocks[1][9] = block_touching_ground_condition;
	
	break;	
	
	case r_lv_08:
	
	blocks[5][4] = block_result_right;
	
	blocks[2][3] = block_while;
	blocks[7][2] = block_result_jump;
	blocks[3][6] = block_whileNot;
	blocks[7][8] = block_whileNot2;
	blocks[4][6] = block_touching_ground_condition;
	blocks[3][7] = block_solid;
	blocks[4][7] = block_solid;
	blocks[5][6] = block_solid;	
	
	break;
	
	case r_lv_09:
	
		
	blocks[3][2] = block_result_jump;
	blocks[3][4] = block_result_right;
	
	blocks[2][7] = block_resolution_gravity;
	blocks[2][4] = block_condition_going_right;

	blocks[5][7] = block_while;

	blocks[9][7] = block_whileNot;
	blocks[9][8] = block_touching_ground_condition;
	
	blocks[7][7] = block_condition_anytime;
	
	blocks[7][8] = block_solid;
	blocks[8][7] = block_solid;
	blocks[8][8] = block_solid;
	blocks[8][9] = block_solid;
	blocks[9][9] = block_solid;	
	
	
	
	break;			
}
/*
blocks[3][4] = block_solid;
blocks[3][5] = block_solid;
blocks[3][6] = block_solid;
blocks[2][6] = block_solid;
blocks[1][6] = block_solid;
blocks[1][5] = block_solid;
blocks[1][4] = block_solid;
*/


updateRules(blocks, allRules);

block_push = function(blocks, x,y,x_add,y_add, selfFunc){
	
	if x < 0 || x >= array_length(blocks){
		return false;
	}
	
	if y < 0 || y >= array_length(blocks[0]){
		return false;
	}
	
	
	var moved_block = -1;

		

		if blocks[x][y] != -1 {
			
			if blocks[x][y].blockType == global.Rules.Solid && !global.canPush {
				return false;
			}
			
			if x+x_add < 0 || x+x_add >= array_length(blocks) || 
			y+y_add < 0 || y+y_add >= array_length(blocks[0]){
				moved_block = false;
				
			}else if blocks[x+ x_add][y + y_add] = -1 { 
				
				blocks[x+x_add][y+y_add] = blocks[x][y];
				blocks[x][y] = -1;
				moved_block = true;
				
				blocks[x+x_add][y+y_add].timer = 0;
				blocks[x+x_add][y+y_add].x = -x_add*tile_size;
				blocks[x+x_add][y+y_add].y = -y_add*tile_size;
				
				//blocks[x+x_add][y+y_add].x = -x_add*tile_size;
				//blocks[x+x_add][y+y_add].y = -y_add*tile_size;
				
				
					blocks[x+x_add][y+y_add].xchange = -x_add*tile_size/12;
					blocks[x+x_add][y+y_add].ychange = -y_add*tile_size/12;
					blocks[x+x_add][y+y_add].xbefore = x_add*tile_size/12;
					blocks[x+x_add][y+y_add].ybefore = y_add*tile_size/12;
	
			}else{
				moved_block = selfFunc( blocks,x+x_add,y+y_add, x_add,y_add, selfFunc);
				if moved_block = 1 || moved_block = -1{
					blocks[x+x_add][y+y_add] = blocks[x][y];
					blocks[x][y] = -1;
					moved_block = true;
					
					blocks[x+x_add][y+y_add].timer = 0;
					blocks[x+x_add][y+y_add].x = -x_add*tile_size;
				 	blocks[x+x_add][y+y_add].y = -y_add*tile_size;
				
					blocks[x+x_add][y+y_add].xchange = -x_add*tile_size/12;
					blocks[x+x_add][y+y_add].ychange = -y_add*tile_size/12;
					blocks[x+x_add][y+y_add].xbefore = x_add*tile_size/12;
					blocks[x+x_add][y+y_add].ybefore = y_add*tile_size/12;
						
						
				}
			}
		}
	return moved_block;
}