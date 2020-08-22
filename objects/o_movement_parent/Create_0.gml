/// @description 
direction_ = 0;
speed_ = 0;
bounce_amount_ = 0;
touching_ground = false;
target_speed = 0;
gravity_y_add = 0; //z_
gravity_speed_ = 0;//z_speed_
gravity_ = 0.2;
jump_force = 0;

up = 0;
down = 0;
right = 0;
left = 0;



enable_gravity = true;


trigger_winstate = false;


function jump(){ 
	
	gravity_speed_ = 0;
	gravity_y_add = 0;
	jump_force = 7;
}