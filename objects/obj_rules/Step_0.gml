if live_call() return live_result;


if global.rightActive && !rightTemp{
	
	rightTemp = true;
}
if !global.rightActive && rightTemp{
	
	with o_movement_parent{
		right = 0;
	}
	
	rightTemp = false;
}

if global.leftActive && !leftTemp{
	
	leftTemp = true;
}
if !global.leftActive && leftTemp{
	
	with o_movement_parent{
		left = 0;
	}
	
	leftTemp = false;
}

global.canPush = false;
global.break_statement = false;
global.rightActive = false;
global.leftActive = false;

for(var i = 0; i < ds_list_size(allRules); i++){
	allRules[| i].run();
}

