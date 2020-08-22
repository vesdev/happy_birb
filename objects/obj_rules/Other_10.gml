/// @description BOON CREATE EVENT

block_result_right = new Block( 
	 "Go\nRight", global.Rules.Result,
	 
	function(){
		with o_movement_parent {
			right = true;
		}
	}
	,
	 s_ui_sprite
);



block_condition_anytime = new Block(
	"ANY\nTIME", global.Rules.Condition, 
	function(){
	return true;
	},s_ui_sprite
);
