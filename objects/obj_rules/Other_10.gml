/// @description BOON CREATE EVENT

block_result_right = new Block( 
	 "Go\nRight", global.Rules.Result,
	function(){
		
		with o_movement_parent {
			left = false;
			right = true;
		}
			global.break_statement = true;
		
			if global.break_statement = true{
				//stop running when this breaks
					execute_temp_script = reset_player;
			}
	}
	,
	 s_block_result
);


block_result_left = new Block( 
	 "Go\nLeft", global.Rules.Result,
	 
	function(){
		with o_movement_parent {
			right = false;
			left = true;
		}
	}
	,
	 s_block_result
);


block_resolution_gravity = new Block(
	"GRAVITY\nOFF", global.Rules.Result, 
	function(){
		with o_movement_parent {
			
			gravity_y_add = 0;
			gravity_speed_ = 0;
			enable_gravity = false;
		
		}
	}
	,s_block_result
);



block_condition_invincible = new Block(
	"INVIN\nCIBLE", global.Rules.Result, 
	function(){
		with o_movement_parent {
			invincible = true;
			invincible_timer = 3;
		}
	}
	,s_block_result
);



block_condition_going_left = new Block(
	"GOING\nLEFT", global.Rules.Condition, 
	function(){
		with o_movement_parent {
			return left;
		}
	}
	,s_block_condition
);


block_condition_going_right = new Block(
	"GOING\nRIGHT", global.Rules.Condition, 
	function(){
		with o_movement_parent {
			return right;
		}
	}
	,s_block_condition
);


block_condition_anytime = new Block(
	"ANY\nTIME", global.Rules.Condition, 
	function(){
	return true;
	},s_block_condition
);
