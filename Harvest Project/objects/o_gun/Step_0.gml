var inst=instance_place(x,y,o_veggie);

if(inst!=noone && !o_player.blow && item==noone) {
	if(inst.lifetime==0 && !inst.dead) {
		if(inst.sprite_index==sp_carrot) {
			audio_play_sound(snd_sucked,120,false);
			inst.caught=true;
			item=inst;
		} else if(inst.sprite_index==sp_potato) {
			audio_play_sound(snd_boom,130,false);
			inst.dead=true;
			inst.image_index=2;
			o_player.hit=true;
		}
	}
}

if(item!=noone) {
	if(!o_player.blow) {
		item.x=x+6*cos(degtorad(image_angle));
		item.y=y-6*sin(degtorad(image_angle));
		item.image_angle=image_angle+90;
		item.depth=depth+2;
		image_index=1;
	} else {
		item.image_angle=image_angle+90;
		item.direction=image_angle;
		item.speed=3;
		item.caught=false;
		audio_play_sound(snd_launch,100,false);
		item=noone;
	}
} else image_index=0;