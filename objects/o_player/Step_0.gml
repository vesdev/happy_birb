/// @description 
event_inherited();
if live_call() return live_result;

#region movement
x = clamp(x,0 , room_width);
y = clamp(y,0 , room_width);


_x_input = o_input.right - o_input.left;
_y_input = o_input.down - o_input.up;


if o_input.m2_pressed{
	game_restart();	
}
if _x_input != 0 or _y_input != 0 {
	direction_ = point_direction(0,0,_x_input,_y_input);

	add_speed(direction_, 3, 3);
}else {
	speed_ = lerp(speed_, 0,.2  );
}
#endregion