if(!dead) {
	getOut(2);
	var dist=point_distance(x,y,o_player.x,o_player.y);
	if(dist<100) move_towards_point(o_player.x,o_player.y,0.5);
	else if(!trigger) {
		trigger=true; 
		alarm[0]=60;
	}
}
else { 
	speed=0;
	if(dissolveAmount>0) dissolveAmount-=0.02;
	else instance_destroy();
}

var inst=instance_place(x,y,o_veggie);
if(inst!=noone && !dead && !inst.dead) {
	if(inst.speed>1) {
		if(!armored) {
			dead=true;
			inst.hitpoints--;
		} else {
			if(inst.sprite_index==sp_potato) {
				armored=false;
				image_index=0;
			}
			inst.hitpoints=0;
		}
	}
}

depth=-y;