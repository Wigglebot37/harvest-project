/// @function		makeGun();
/// @description	Drawing gun.
function makeGun() {
	var _ysc=1, off=9;
	var _dir=point_direction(x,y-off,mouse_x,mouse_y);
	if(_dir>90 && _dir<270) _ysc=-1;
	o_gun.x=x;
	o_gun.y=y-off;
	o_gun.image_angle=_dir;
	o_gun.image_yscale=_ysc;
	var vis=o_suck.visible;
	if(suck || blow) {
		if(!vis) o_suck.visible=true;
		o_suck.x=x+12*cos(degtorad(_dir));
		o_suck.y=y-off-12*sin(degtorad(_dir));
		o_suck.image_angle=_dir-90;
		if(suck) o_suck.sprite_index=sp_suck;
		else o_suck.sprite_index=sp_blow;
	} else {
		if(vis) o_suck.visible=false;
	}
}