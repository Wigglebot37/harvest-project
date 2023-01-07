/// @function		makeGun();
/// @description	Drawing gun.
function makeGun() {
	var _ysc=1, off=9;
	var _dir=point_direction(x,y-off,mouse_x,mouse_y);
	if(_dir>90 && _dir<270) _ysc=-1;
	draw_sprite_ext(sp_gun,0,x,y-off,1,_ysc,_dir,c_white,1);
	if(suck) draw_sprite_ext(sp_suck,sub,x+10*cos(degtorad(_dir)),y-off-10*sin(degtorad(_dir)),1,1,_dir-90,c_white,1);
}