/// @description 

if instance_exists(o_close_transition) exit;


var w = display_get_gui_width();
var h = display_get_gui_height();
draw_set_halign(fa_center);
draw_set_font(global.font_large);

draw_text_transformed(w/2,h/4,string("YOU ARE FANTASTIC")
,.2,.2,0);


draw_set_font(f_kenny);

var offset = 20;
draw_set_color(c_black);
draw_set_alpha(.5);
draw_rectangle(0,h/2-offset+7,w,h/2+offset+7+20,0)
draw_set_color(c_white);
draw_set_alpha(1)
draw_text_transformed(w/2,h/2-10,string("CREDITS\n@soVesDev\nOscar @BOONdev Gonzalez")
,.5,.5,0);

draw_set_font(f_kenny);
draw_set_halign(fa_left);
draw_set_valign(fa_top);