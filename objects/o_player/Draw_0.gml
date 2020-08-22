/// @description 
if live_call() return live_result;

if instance_exists(o_close_transition) and o_close_transition.state = close.circle_open_close {
		sprite_index = s_parrot_happy;
		trigger_winstate = true;
		if trigger_winstate {
			image_angle = lerp(image_angle,-45,.15);	
		}
}else{
	if touching_ground { 
		sprite_index = s_parrot;

	}else{
		sprite_index = s_parrot_control;
	} 
}


draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
if !trigger_winstate {
	move(true);
}