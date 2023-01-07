if(!dead) move_towards_point(o_player.x,o_player.y,0.6);
else { 
	speed=0;
	if(dissolveAmount>0) dissolveAmount-=0.02;
	else instance_destroy();
}

var inst=instance_place(x,y,o_veggie);
if(inst!=noone) {
	if(inst.speed>1) dead=true;
}

depth=-y;