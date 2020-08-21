// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.Rules = {
	While : function(_callBack, _result){
		if _callBack{
			_result();
		}
	},
	
	WhileNot : function(_callBack, _result){
		if !_callBack{
			_result();
		}
	},
	
	Is : function(_callBack, _result){ //logic based on the condition, could also be if !callBack
		_result();
	}
}

function Rule(_result, _condition, _statement) constructor{
	result = _result;
	statement = _statement;
	condition = _condition;
	
	function run(){
		statement(condition(),result);
	}
}
