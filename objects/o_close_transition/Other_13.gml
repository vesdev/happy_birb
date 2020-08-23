/// @description CIRCLE OPEN
/// @description add a surface the size of the room


if second_target != noone
{
	if instance_exists(second_target)
	{
		x = second_target.x;
		y = second_target.y;
	}
}

if (surface_exists(surf)) {
	surface_set_target(surf);
	//Set the dark overlay
	draw_set_colour(c_black);
	draw_set_alpha(1);

	draw_rectangle(0,0,room_width+4000,room_height+3000,0);	

	//Set light circles
	gpu_set_blendmode(bm_subtract);
	draw_set_colour(c_white);
	//Set light circles
	gpu_set_blendmode(bm_subtract);
	draw_set_colour(c_white);
	
	
	var total_change = 0;
	var difference = 50;
	
	//1.4 becaues that's how long our alarm is
//	radius = easings(e_ease.easeinquart,1, 600,SEC*1.4,timer);
//	timer++;
	
	draw_set_alpha(1);


	draw_circle(return_gui_x( target.x + random_range(-.2,.2)),return_gui_y(  target.y+ random_range(-.2,.2)),radius,false);

	timer++;
	if timer <= time {
	radius = easings(e_ease.easeoutback,total_change, -total_change+difference,time,timer);
	}
	
	if timer2 <= time2 and timer > time and timer > time2 + SEC*.5 {
		radius = easings(e_ease.easeinexpo,difference, difference*5,time2,timer2);
		timer2++;
	}	


	//Reset all of the set draws, or else everything else gets the overridden blend modes
	gpu_set_blendmode(bm_normal);
	draw_set_alpha(1);
	surface_reset_target();
}else{
	surf = surface_create(1000,1000);
	surface_set_target(surf);
	draw_clear_alpha(c_black,0);
	draw_set_color(c_white);
	surface_reset_target();
}
