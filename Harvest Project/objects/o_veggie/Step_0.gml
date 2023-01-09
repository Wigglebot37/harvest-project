if(lifetime==0 && !dead) image_index=1;
if(speed>0 && !(place_meeting(x,y,o_suck) && o_suck.visible)) {
	if(sprite_index==sp_carrot) speed-=0.04;
	else speed=0;
}

if(!caught) getOut(2);

if(hitpoints<=0) {
	dead=true;
}

if(dead) {
	if(dissolveAmount>0) dissolveAmount-=0.04;
	else instance_destroy();
}