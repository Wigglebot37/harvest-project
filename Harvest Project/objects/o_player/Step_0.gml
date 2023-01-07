var _v=keyboard_check(ord("S"))-keyboard_check(ord("W"));
var _h=keyboard_check(ord("D"))-keyboard_check(ord("A"));
var _dir=(_h!=0||_v!=0) ? point_direction(0,0,_h,_v) : -1;
image_speed=1;
if(_dir!=-1) moveCollide(_dir,1);
else { speed=0; image_speed=0; image_index=0; }
if(speed==0) {
	x=round(x);
	y=round(y);
} else {
	if(direction==UP || direction==DOWN) x=round(x);
	else if(direction==LEFT || direction==RIGHT) y=round(y);
}
o_gun.depth=-y-10;
var _dir=point_direction(x,y-9,mouse_x,mouse_y);
if(_dir<45 || _dir>315) sprite_index=sp_right;
else if(_dir>=45 && _dir<135) { sprite_index=sp_up; o_gun.depth=-o_gun.y; }
else if(_dir>=135 && _dir<225) sprite_index=sp_left;
else if(_dir>=225 && _dir<=315) sprite_index=sp_down;

if(sprite_index=sp_up) up=true;
else up=false;

var blowcheck=mouse_check_button(mb_right), suckcheck=mouse_check_button(mb_left);
if(suckcheck && !blowcheck && o_gun.item==noone) suck=true;
else if(blowcheck && !suckcheck) blow=true;
else { suck=false; blow=false; }

if(suck) sub+=0.1;
else if(blow) sub-=0.1;
else sub=0;
if(sub>=4 && suck) sub=0;
else if(sub<=0 && blow) sub=4;

depth=-y;