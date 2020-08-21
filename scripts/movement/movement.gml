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
	live_name = "move";
	if (live_call()) return live_result;
//	if speed_ = 0 exit;

	tilemap = layer_tilemap_get_id("Collisions");
	 //enable bouncing off walls

	_x_speed = lengthdir_x(speed_, direction_);
	_y_speed = lengthdir_y(speed_, direction_);




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
	if (_y_speed > 0)  bbox_side = bbox_bottom; else bbox_side = bbox_top;
	if (tilemap_get_at_pixel(tilemap,bbox_left,bbox_side+_y_speed) != 0) ||
	(tilemap_get_at_pixel(tilemap,bbox_right, bbox_side+_y_speed) != 0)
	{

		if (_y_speed > 0) {
			//x = x - (x % 32) mod returns remainder
			//snaps to a 32 to 32 grid
			y = y - (y mod 32) + 32 - (bbox_bottom - y)-1;
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