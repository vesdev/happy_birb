/// @description 

if keyboard_check_pressed(ord("F")){
	//room_goto(r_lv_07);	
}
if instance_exists(intro_controller) exit;


if keyboard_check_pressed(ord("Q")) && DEBUG{
	room_goto_previous();	
}

if keyboard_check_pressed(ord("E")){
	
	room_restart_custom();
}

if keyboard_check_pressed(ord("M")){
	
	global.music_enabled = !global.music_enabled;
	if !global.music_enabled {
		audio_stop_sound(snd_music);
	}else{
		audio_play_sound(snd_music,0,true);
	}
}


if keyboard_check_pressed(ord("R"))  && DEBUG{
	room_goto_next();	
}

if keyboard_check_pressed(vk_space){
	room_restart_custom();
}

global.timeScale = lerp(global.timeScale,1,.01);
