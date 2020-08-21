
block_while = new Block("while", global.Rules.Statement, global.Rules.While, s_block);
block_whileNot = new Block("while\nnot", global.Rules.Statement, global.Rules.WhileNot, s_block);

block_result_hi = new Block(
	"say\nhi", global.Rules.Result, 
	function(){
		show_debug_message("hi");
	},
	s_block
);

block_condition = new Block(
	"true", global.Rules.Condition, 
	function(){
		return true;
	},
	s_block
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

blocks[1][3] = block_result_hi;
blocks[2][3] = block_while;
blocks[3][3] = block_condition;

updateRules(blocks, allRules);