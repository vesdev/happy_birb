
for(var i = 0; i < ds_list_size(trail); i++){
	
	draw_sprite_ext(sprite_index,image_index,trail[| i][0],trail[| i][1],image_xscale,image_yscale,trail[| i][2],image_blend,i/maxTrail-.3);
	
}

draw_self();
