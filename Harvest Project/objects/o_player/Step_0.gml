var _v=keyboard_check(ord("S"))-keyboard_check(ord("W"));
var _h=keyboard_check(ord("D"))-keyboard_check(ord("A"));
var _dir=(_h!=0||_v!=0) ? point_direction(0,0,_h,_v) : -1;
if(_dir!=-1) moveCollide(_dir,1);
else speed=0;
if(speed==0) {
	x=round(x);
	y=round(y);
} else {
	if(direction==UP || direction==DOWN) x=round(x);
	else if(direction==LEFT || direction==RIGHT) y=round(y);
}
switch(direction) {
	case UP: image_index=4; break;
	case UP_RIGHT: image_index=5; break;
	case RIGHT: image_index=6; break;
	case DOWN_RIGHT: image_index=7; break;
	case DOWN: image_index=0; break;
	case DOWN_LEFT: image_index=1; break;
	case LEFT: image_index=2; break;
	case UP_LEFT: image_index=3;
}
if(_dir!=-1) log(direction);