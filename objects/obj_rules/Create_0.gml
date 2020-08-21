if live_call() return live_result;


block_while = new Block("while", global.Rules.Statement, global.Rules.While, s_ui_sprite);
block_whileNot = new Block("while\nnot", global.Rules.Statement, global.Rules.WhileNot, s_ui_sprite);

block_result_hi = new Block(
	"say\nhi", global.Rules.Result, 
	function(){
		show_debug_message("hi");
	},
	s_ui_sprite
);

block_result_jump = new Block( 
	 "Player\nJump", global.Rules.Result,
	 o_movement_parent.jump,
	 s_ui_sprite
); 


block_touching_ground_condition = new Block(
	"ON GROUND", global.Rules.Condition, 
	function(){
		
		with o_movement_parent {
			return touching_ground;
		}
	},s_ui_sprite
);


block_condition = new Block(
	"true", global.Rules.Condition, 
	function(){
		return true;
	},
	s_ui_sprite
);

//set up grid
blocks = [];
blocks_w = 10;
blocks_h = 10;
for(var i = 0; i < blocks_w ; i++){
	blocks[i] = [];
	for(var j = 0; j < blocks_h ; j++){
		blocks[i][j] = -1;
	}
}


allRules = ds_list_create();
updateRules = function(blocks, ruleDsList){
	ds_list_clear(ruleDsList);
	for(var i = 0; i < blocks_w ; i++){
		for(var j = 0; j < blocks_h ; j++){
			
			if blocks[i][j] != -1{
			
			if blocks[i][j].rule != undefined{
				delete blocks[i][j].rule;
			}
			
				if blocks[i][j].blockType = global.Rules.Statement{
				
					if i > 0 && i < blocks_w-1{
					
						if blocks[i][j].rule = undefined && 
						(blocks[i-1][j].blockType = global.Rules.Result && blocks[i+1][j].blockType = global.Rules.Condition){
							blocks[i][j].rule = new Rule(
								blocks[i-1][j].func,
								blocks[i+1][j].func,
								blocks[i][j].func
							)
							ds_list_add(ruleDsList, blocks[i][j].rule);
						}
					}	
				}
				
			}
			
		}
	}
	
}

//temporary stuff

blocks[1][3] = block_result_jump;
blocks[2][3] = block_while;
blocks[3][3] = block_touching_ground_condition;

updateRules(blocks, allRules);