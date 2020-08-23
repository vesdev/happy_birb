/// @description

if !instance_exists(o_game) exit;
var w = display_get_gui_width();
var h = display_get_gui_height();
var end_offset = 20;

	var wavy_text = 0;
	var len = 0;	
	var y_pos = 0;
	//var angle = point_direction(0,0,w,y_height*2);
	//var angle2 = point_direction(0,h-y_height*2,w,h);


draw_set_alpha(1);
switch state{
case 0: //vertical
		draw_rectangle_color(0,0,w1,h,default_color,default_color,default_color,default_color,false);
		draw_rectangle_color(w2,0,w,h,default_color,default_color,default_color,default_color,false);





		w1 = lerp(w1,0,lerp_amount);
		w2 = lerp(w2,w,lerp_amount);	
		if w1 = 0{
		instance_destroy();	
		}
break;
case 1: //horizontal

//		draw_rectangle_color(0,0,w,h1,default_color,default_color,default_color,default_color,false);
//		draw_rectangle_color(0,h2,w,h,default_color,default_color,default_color,default_color,false);


		draw_sprite(s_close_transition,0,w,h1);


		if instance_exists(o_game){
		h1 = lerp(h1,0,lerp_amount);
		h2 = lerp(h2,h,lerp_amount);	
		if h1 = 0{
		instance_destroy();	
		}
	}	
break;

case 2: //triangle



var dir =  point_direction(try1x,0,0,try1y);
var dir2 =  point_direction(try2x,h,w,0);


draw_triangle_color(-5,0,try1x,-5,-5,try1y,
default_color,default_color,default_color,false);
draw_triangle_color(try2x,h,w,0,w,h,
default_color,default_color,default_color,false);

	if instance_exists(o_game) {
		try1x = lerp(try1x,0,lerp_amount);	
		try2x = lerp(try2x,w,lerp_amount);
		if try1x = 0{
		instance_destroy();	
		}
	}

break;

case 3:


draw_triangle_color(0,0,0,try1y*.5,try1x,0, //tl bl //tr
default_color,default_color,default_color,false);

draw_triangle_color(try2x,h,w,try2y*2,w,h, //bl tr //br
default_color,default_color,default_color,false);

var dir =  point_direction(0,try1y,try1x,0);
var dir2 =  point_direction(try2x,h,w,try2y);
draw_set_color(c_white);

		try1x = lerp(try1x,0,lerp_amount);
		try1y = lerp(try1y,0,lerp_amount);	
		
		try2x = lerp(try2x,w,lerp_amount);
		try2y = lerp(try2y,h,lerp_amount);
		if try1x <= .1 or try2x = w or try2y = h {
		instance_destroy();	
		}
	
break;
}
draw_set_color(c_white);