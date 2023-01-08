var _v=keyboard_check(ord("S"))-keyboard_check(ord("W"));
var _h=keyboard_check(ord("D"))-keyboard_check(ord("A"));
var _dir=(_h!=0||_v!=0) ? point_direction(0,0,_h,_v) : -1;
image_speed=1;
if(_dir!=-1) moveCollide(_dir,1);
else { speed=0; image_speed=0; image_index=0; }
if(speed==0) {
	if(audio_is_playing(snd_footstep)) audio_stop_sound(snd_footstep);
	x=round(x);
	y=round(y);
} else {
	if(!audio_is_playing(snd_footstep)) audio_play_sound(snd_footstep,100,true);
	if(direction==UP || direction==DOWN) x=round(x);
	else if(direction==LEFT || direction==RIGHT) y=round(y);
}
o_gun.depth=-y-10;
var _dir=point_direction(x,y-9,mouse_x,mouse_y);
if(_dir<45 || _dir>315) sprite_index=sp_right;
else if(_dir>=45 && _dir<135) { sprite_index=sp_up; o_gun.depth=-y+10; }
else if(_dir>=135 && _dir<225) sprite_index=sp_left;
else if(_dir>=225 && _dir<=315) sprite_index=sp_down;

var blowcheck=mouse_check_button(mb_right), suckcheck=mouse_check_button(mb_left);
if(suckcheck && !blowcheck && o_gun.item==noone) suck=true;
else if(blowcheck && !suckcheck) blow=true;
else { suck=false; blow=false; }

if(!instance_exists(o_veggie) && !paused && !instance_exists(o_evilEnemy)) {
	instance_create_layer(0,0,"Instances",o_evilEnemy);
}

if(suck) sub+=0.1;
else if(blow) sub-=0.1;
else sub=0;
if(sub>=4 && suck) sub=0;
else if(sub<=0 && blow) sub=4;

if(invincibility>0) invincibility-=0.02;

var inst=instance_place(x,y,o_enemy);
if(inst!=noone && !gameOver && !hit && invincibility==0) {
	var col=rectangle_in_rectangle(x-7,y-3,x+7,y+2,inst.x-7,inst.y-3,inst.x+7,inst.y+2);
	if(!inst.dead && col) hit=true;
}

if(hit) {
	hitpoints--;
	if(hitpoints<=0) gameOver=true;
	invincibility=1;
	hit=false;
}

depth=-y;