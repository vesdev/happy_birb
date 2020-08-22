if tilemap_get_at_pixel(tilemap,x,bbox_bottom+spd*dir*global.timeScale){
	dir = -1;
}

if tilemap_get_at_pixel(tilemap,x,bbox_top+spd*dir*global.timeScale){
	dir = 1;
}

y += dir*spd*global.timeScale;
image_angle+=spd*global.timeScale;

if place_meeting(x,y,o_player){
	room_restart();
}

timer += global.timeScale;

if timer >= time{
	ds_list_add(trail,[x,y,image_angle]);
	timer = 0;
	
	if ds_list_size(trail) > maxTrail{
		ds_list_delete(trail,0);
	}
}