/// @description 
if live_call() return live_result;



if touching_ground { 
	sprite_index = s_parrot;

}else{
	sprite_index = s_parrot_control;
}


draw_self();

move(true);