if live_call() return live_result;


 


global.canPush = false;
global.break_statement = false;

for(var i = 0; i < ds_list_size(allRules); i++){
	allRules[| i].run();
}

