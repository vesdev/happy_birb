
whileExample = new Rule( 
	function(){
		show_debug_message("hi");
	},
	function(){
		return true;
	},
	global.Rules.While
);

whileExample.run();

delete whileExample;

val = 0;

isExample = new Rule( 
	function(){
		id.val = 10;
	},
	function(){}, //is doesn't need a condition so pass in a empty function
	global.Rules.Is
);

show_debug_message(val);
isExample.run();
show_debug_message(val);

delete isExample;