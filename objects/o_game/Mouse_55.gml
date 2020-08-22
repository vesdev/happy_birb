/// @description 
if live_call() return live_result;
instance_destroy(o_close_transition);
var s = create(o_player.x,o_player.y,o_close_transition);
s.target = o_player;
s.next_room = r_lv_01;
s.second_target = o_player;
s.state = close.circle_open_close;