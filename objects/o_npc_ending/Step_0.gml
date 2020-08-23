/// @description 
event_inherited();

if instance_exists(o_close_transition) and o_close_transition.state = close.circle_open_close{
var s = random_range(-30,40);
x = 235+s;
y = 160;
}

if touching_ground {
	jump_force = random_range(1,1.5);
	angle = random_range(15,-15);
}

//var dir = point_direction(x,y,mouse_x,mouse_y);

//add_speed(dir, 6,6)
var sc = .06;
xscale = sc;
yscale = sc;