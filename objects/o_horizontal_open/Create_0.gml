/// @description 




var w = display_get_gui_width();
var h = display_get_gui_height();

state = choose(1,0,2);	
state = 0;
default_color = make_color_rgb(168,122,79);
lerp_amount = .2;

	w1 = w/2;
	w2 = w/2;

switch state{
	
case 0: //vertical
	w1 = w/2;
	w2 = w/2;
	break;
	
case 1: //horizontal
	h1 = h/2;
	h2 = h/2;
break;
case 2: //diag left
	try1x = w;
	try1y = h;
	try2x = 0;
	try2y = 0;
break;

case 3: //diag right
try1x = w;
try1y = h;

try2x = 0;
try2y = 0;

break;
}




