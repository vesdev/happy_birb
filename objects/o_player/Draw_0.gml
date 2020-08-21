/// @description 
if live_call() return live_result;


if touching_ground {
	if o_input.action {
		gravity_speed_ = 0;
		gravity_y_add = 0;
		jump_force = 7;
	}
}


draw_self();

move(true);