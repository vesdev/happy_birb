/// @description double_circle transitions
	timer++;
	

persistent = true;

if second_target = noone{
instance_destroy();
	exit;
}


if (surface_exists(surf)) {
	surface_set_target(surf);
	//Set the dark overlay
	
	

	draw_clear_alpha(c_black,1);

	//Set light circles
	gpu_set_blendmode(bm_subtract);
	draw_set_colour(c_white);
	//Set light circles
	gpu_set_blendmode(bm_subtract);
	draw_set_colour(c_white);
	//1.4 becaues that's how long our alarm is
//	if alarm[2] > -1{

	var total_change = 300;
	var difference = 30;


	
	if timer <= time {
	radius = easings(e_ease.easeoutexpo,total_change, -total_change+difference,time,timer);
	}

	
	if timer2 <= time2 and timer > time and timer > time2 + SEC*.5 {
		radius = easings(e_ease.easeinback,difference, -difference,time2,timer2);
		timer2++;
	}
	
		draw_circle(target.x + random_range(-.2,.2), target.y+ random_range(-.2,.2),radius,false);

//	}
//	if alarm[3] > -1{
//	radius = easings(e_ease.easeinquad,0, -350,time2,timer2);
//	timer2++;
//	draw_circle(target.x + random_range(-.2,.2), target.y+ random_range(-.2,.2),radius,false);
//	}
//  Reset all of the set draws, or else everything else gets the overridden blend modes
	gpu_set_blendmode(bm_normal);
	draw_set_alpha(1);
	surface_reset_target();
}else{
	surf = surface_create(room_width,room_height);
	surface_set_target(surf);
	draw_clear_alpha(c_black,0);
	draw_set_color(c_white);
	surface_reset_target();
}

if timer2 > time2 and timer > time2 + time+  SEC*.5 or instance_exists(intro_controller) and intro_controller.begin_ = true{
	
	
	
	if next_room != noone{
		timer = 0;
		timer2 = 0;
		room_goto(next_room);
		alarm[3] = time2;
		
		with intro_controller{ 
			begin_ = false;
		}
	}
}