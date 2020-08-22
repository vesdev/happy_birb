/// @description BOON CREATE EVENT
if live_call() return live_result;
/*
block_result_right = new Block( 
	 "Move\nRight", global.Rules.Result,
	 o_movement_parent.right,
	 s_ui_sprite
);


block_condition_anytime = new Block(
	"ANY/nTIME", global.Rules.Condition, 
	function(){
			return true;
	},s_ui_sprite
);
