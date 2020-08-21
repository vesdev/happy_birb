// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.Rules = {
	While : function(_condition, _result){
		if _condition(){
			_result();
		}
	},
	
	WhileNot : function(_condition, _result){
		if !_condition(){
			_result();
		}
	},
	
	Result : 0,
	Condition: 1,
	Statement : 2
}

function Block(_name, _type, _function, _sprite) constructor {
	name = _name;
	blockType = _type;
	func = _function;
	sprite = _sprite;
	rule = undefined;
	x = 0;
	y = 0;
}

function Rule(_result, _condition, _statement) constructor{
	result = _result;
	statement = _statement;
	condition = _condition;
	
	static run = function(){
		
		self.statement(self.condition,self.result);//this is not running
	};
}
