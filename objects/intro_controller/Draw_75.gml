/// @description 
if live_call() return live_result;

var w = display_get_gui_width();
var h = display_get_gui_height();

if begin_ {
	
	if instance_exists(o_player) and !instance_exists(o_close_transition){
	
		var s = create(o_player.x,o_player.y,o_close_transition);
		s.target = o_player;
		s.next_room = r_lv_01;
		s.second_target = o_player;
		s.state = close.circle_open_close;
	}
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_rectangle(0,0,w,h,0);
	draw_set_color(c_white);
	draw_set_alpha(1);
	exit;
}


	
timer4--;

	draw_set_alpha(alpha);
	draw_set_color(c_black);
	draw_rectangle(0,0,w,h,0);
	draw_set_color(c_white);
	draw_set_alpha(1);
if timer4 < 0{
	alpha = approach(alpha,0,.1);
}
if keyboard_check_pressed(vk_escape) {
	instance_destroy();
	exit;
}

if state < ds_list_size(list) {
	
	


scribble_set_wrap(200,80);
scribble_draw(w/2,h/6,output_string);
scribble_reset();

if keyboard_check_pressed(vk_anykey) {
	state++;
	event_user(0);	
	
}

}else{
	instance_destroy();	
}


with o_close_transition {
	if state != close.circle_open_close{
	timer2 = 0;
	alarm[0] = SEC*2.1;
	alarm[1] = SEC*2.1;
	alarm[3] = SEC*2.1;
	}
}
