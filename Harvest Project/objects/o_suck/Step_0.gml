var inst=instance_place(x,y,o_veggie);

if(inst!=noone && visible) {
	if(o_player.suck) {
		if(angleswitch) angle+=4;
		else angle-=4;
		if(angle>=30) angleswitch=false;
		else if(angle<=-30) angleswitch=true;
		inst.image_angle=angle;
		if(inst.lifetime>0) inst.lifetime--;
		else if(!inst.caught) {
			with(inst) move_towards_point(o_gun.x,o_gun.y,1);
		}
	} else if(o_player.blow) {
		inst.image_angle=image_angle;
		inst.direction=image_angle+90;
		inst.speed=3;
	}
}