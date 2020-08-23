if live_call() return live_result;



if global.break_statement = true and execute_temp_script_flag{ 
	execute_temp_script_flag = false;
	
	if execute_temp_script != noone {

		script_execute(execute_temp_script);
		execute_temp_script = noone;
	}
}


if !execute_temp_script_flag and !global.break_statement{
	execute_temp_script_flag = true;


}


global.canPush = false;
global.break_statement = false;

for(var i = 0; i < ds_list_size(allRules); i++){
	allRules[| i].run();
}

