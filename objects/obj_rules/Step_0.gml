
global.canPush = false;

for(var i = 0; i < ds_list_size(allRules); i++){
	allRules[| i].run();
}