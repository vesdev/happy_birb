// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function approach(_current, _target, _amount){
	if (_current < _target) {
	    return min(_current+_amount, _target); 
	} else {
	    return max(_current-_amount, _target);
	}
}

function transition (next_room) { 
	
	instance_create_layer(0,0,"Instances",o_transition);
	
	
	
}