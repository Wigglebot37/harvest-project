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
	case UP: sprite_index=sp_up; break;
	case RIGHT: sprite_index=sp_right; break;
	case DOWN: sprite_index=sp_down; break;
	case LEFT: sprite_index=sp_left; break;
}
//if(_dir!=-1) log(direction);
if(sprite_index=sp_up) up=true;
else up=false;
if(mouse_check_button(mb_left)) suck=true;
else suck=false;
if(sub<3.9) sub+=0.1;
else sub=0;