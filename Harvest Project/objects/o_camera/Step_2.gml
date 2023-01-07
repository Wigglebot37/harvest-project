/// @description Sets View Size
// Sets size of view
camera_set_view_size(view,view_w,view_h);

// Sets position of view
if(instance_exists(o_player)) {
	// Centers on object coordinates, makes sure camera doesn't go outside room
	var test_x=clamp(o_player.x-view_w/2,0,room_width-view_w);
	var test_y=clamp(o_player.y-view_h/2,0,room_height-view_h);
	
	// Retrieves current view coordinates
	var cur_x=camera_get_view_x(view);
	var cur_y=camera_get_view_y(view);
	// Sets a speed to lerp at
	var spd=0.1;
	// Sets the camera view position to scale towards object position
	camera_set_view_pos(view,lerp(cur_x,test_x,spd),lerp(cur_y,test_y,spd));
}