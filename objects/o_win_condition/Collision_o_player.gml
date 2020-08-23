/// @description 

if !instance_exists(o_close_transition){
	var s = create(o_player.x,o_player.y,o_close_transition);
	s.target = o_player;
	s.second_target = o_player;
	s.state = close.circle_open_close;
	if room = rm_testing {//put last room here
	
	}else{
	s.next_room = room_next(room);	
	}



}

//instance_create_layer(0,0,"Instances",o_transition);