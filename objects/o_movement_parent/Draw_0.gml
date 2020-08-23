/// @description 
if live_call() return live_result;

with obj_rules{
	
}

if object_index = o_player{
	if instance_exists(o_close_transition) and o_close_transition.state = close.circle_open_close || 
	room = r_lv_ending
	{
		
		
		if	room = r_lv_ending and !instance_exists(o_close_transition){
			if touching_ground {
				
				jump_force = random_range(3,6);
				angle = random_range(25,-25);	
			}
				sprite_index = s_parrot_happy;
		}else if instance_exists(o_close_transition) and o_close_transition.timer > o_close_transition.time{
			sprite_index = s_parrot_happy;
		}
		
		
			trigger_winstate = true;
			if trigger_winstate and room != r_lv_ending {
				sprite_index = s_parrot_happy;
				angle = lerp(angle,-45,.15);	
			}
	}else{
		if touching_ground { 
			sprite_index = s_parrot;
		}else{
			sprite_index = s_parrot_control;
		} 
	}
}


draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale,angle,
image_blend,image_alpha);
if 	trigger_winstate = true and room != r_lv_ending exit;
move(true);
