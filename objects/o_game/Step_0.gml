/// @description 


if keyboard_check_pressed(vk_f9){
	room_goto(rm_testing);	
}
if keyboard_check_pressed(ord("F")){
	room_goto(r_lv_08);	
}

if keyboard_check_pressed(ord("Q")){
	room_goto_previous();	
}

if keyboard_check_pressed(ord("E")){
	room_restart();	
}

if keyboard_check_pressed(ord("R")){
	room_goto_next();	
}

if keyboard_check_pressed(vk_space){
	room_restart();
}