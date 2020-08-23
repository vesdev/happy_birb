
function add_speed(_direction, _acceleration,_max_speed) {
	
	 _x_speed = lengthdir_x(speed_, direction_);
	 _y_speed = lengthdir_y(speed_, direction_);

	var _x_acceleration = lengthdir_x(_acceleration, _direction);
	var _y_acceleration = lengthdir_y(_acceleration, _direction);

	_x_speed += _x_acceleration;
	_y_speed += _y_acceleration;

	speed_ = point_distance(0, 0, _x_speed, _y_speed);
	direction_ = point_direction(0, 0, _x_speed, _y_speed);
	speed_ = min(speed_, _max_speed);
}



function move(_bounce){
	
//	if speed_ = 0 exit;
	live_name = "move";
	if live_call() return live_result;
	tilemap = layer_tilemap_get_id("Collisions");
	 //enable bouncing off walls

	_x_speed = lengthdir_x(speed_, direction_);
	_y_speed = lengthdir_y(speed_, direction_);

	var xdiv = x div 32;
	var ydiv = y div 32;
	var xmult = xdiv * 32;
	var ymult = ydiv * 32;
	//y =  ymult+32-sprite_get_yoffset(sprite_index);

	if _x_speed > 0  bbox_side = bbox_right; else bbox_side = bbox_left;
	if (tilemap_get_at_pixel(tilemap,bbox_side+_x_speed,bbox_top) != 0) || 
	(tilemap_get_at_pixel(tilemap,bbox_side+_x_speed, bbox_bottom) != 0)
	{
	
		if (_x_speed > 0) {
			//x = x - (x % 32) mod returns remainder
			//snaps to a 32 to 32 grid
			x = x - (x mod 32)+32  - (bbox_right - x)-1;
			_x_speed = -(_x_speed)*bounce_amount_;

			}else{ x = x - (x mod 32) - (bbox_left - x);
			_x_speed = -(_x_speed)*bounce_amount_;
		}
	}else{
		x += _x_speed;
	}
	//VERTICLE TILE COLLISIONS
	

	if jump_force > 0 { 
		jump_force = approach(jump_force,0,.1);
		y -= jump_force;
	}



	var collision_object_ = o_plataform_parent;
	
	if place_meeting(x, y+_y_speed, collision_object_) {
		if !place_meeting(x, y+sign(_y_speed), collision_object_) {
		
		
			y  =  y div 32;
			y *= 32;
			y += 32;
			y -= sprite_get_yoffset(sprite_index);
			y += sign(_y_speed);
		}
		
			jump_force = -5;
			gravity_y_add  = 0;
			gravity_speed_ = 0;
			touching_ground = true;
			exit;
	}


	if object_index != o_player{
		offset = 2;
	}else{
	var offset = 1;	
	}
	var bbox_side = bbox_bottom;	
	if (tilemap_get_at_pixel(tilemap,bbox_right, bbox_side+offset) = 0) and
		(tilemap_get_at_pixel(tilemap,bbox_left, bbox_side+offset) = 0)
	{	
		
		
		
		if enable_gravity {
			gravity_y_add += gravity_speed_;
			gravity_speed_ += gravity_;
		}
		enable_gravity = true;
	
		if (tilemap_get_at_pixel(tilemap,bbox_left,bbox_side+gravity_speed_)= 0) and
		  (tilemap_get_at_pixel(tilemap,bbox_right, bbox_side+gravity_speed_) = 0)
		{	
			gravity_speed_ = clamp(gravity_speed_,0 , 8); 
			y += gravity_speed_;
		}else{ 
			y  =  y div 32;
			y *= 32;
			y += 32;
			y -= sprite_get_yoffset(sprite_index);
	
			jump_force = 0;
			gravity_y_add  = 0;
			gravity_speed_ = 0;
		}
			touching_ground = false;
	}else{
			touching_ground = true;
			jump_force = 0;
			gravity_y_add = 0;
			gravity_speed_ = 0;
	}
	
	if (_y_speed > 0)  bbox_side = bbox_bottom; else bbox_side = bbox_top;
		if (tilemap_get_at_pixel(tilemap,bbox_left,bbox_side+_y_speed) != 0) ||
		(tilemap_get_at_pixel(tilemap,bbox_right, bbox_side+_y_speed) != 0)
		{
		
		
			gravity_y_add = 0;
			gravity_speed_ = 0;	
			jump_force = 0;

		if (_y_speed > 0) {
			//x = x - (x % 32) mod returns remainder
			//snaps to a 32 to 32 grid
			y = y - (y mod 32) + 32 - (bbox_bottom - y)-offset;
			_y_speed = -(_y_speed)*bounce_amount_;

		}else{
			y = y-(y mod 32) - (bbox_top - y);
			_y_speed = -(_y_speed)*bounce_amount_;

		}
	}else{
		y += _y_speed;
	
	}
	
	speed_ = point_distance(0, 0, _x_speed, _y_speed);
	direction_ = point_direction(0, 0, _x_speed, _y_speed);
	
}