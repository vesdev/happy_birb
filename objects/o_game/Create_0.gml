/// @description 

scribble_init("Fonts", "f_kenny_scribble", true);


window_set_size(1280,720)
alarm[1] = 1;
#macro SEC game_get_speed(gamespeed_fps)
#macro DEBUG 1

global.break_statement = false;
global.music_enabled = true;

global.timeScale = 1;
alarm[0] = 10;

var _font_string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
global.font_large = font_add_sprite_ext(s_kenny_font, _font_string, true, 1);



if DEBUG = false{
create(0,0,intro_controller);
room_goto(r_lv_01);
}else{
room_goto(r_lv_10);	
}