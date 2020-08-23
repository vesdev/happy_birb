/// @description 

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


#region invincible

if invincible {
	
	_time += 1 / room_speed;
	shader_set(shd_rainbow);
    var uv = sprite_get_uvs(sprite_index, image_index);
    shader_set_uniform_f(_uniUV, uv[0], uv[2]);
    shader_set_uniform_f(_uniSpeed, _speed);
    shader_set_uniform_f(_uniTime, _time);
    shader_set_uniform_f(_uniSaturation, _saturation);
    shader_set_uniform_f(_uniBrightness, _brightness);
    shader_set_uniform_f(_uniSection, _section);
    shader_set_uniform_f(_uniMix, _mix);
	  draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale,angle,image_blend,image_alpha);	
	shader_reset();
}else{

draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale,angle,
image_blend,image_alpha);	
}
#endregion
if 	trigger_winstate = true and room != r_lv_ending exit;
move(true);
