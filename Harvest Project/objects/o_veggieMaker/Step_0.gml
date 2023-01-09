if(timer>0) timer-=0.04;

if(!instance_exists(instance) && instance!=noone && !paused) {
	timer=4;
	instance=noone;
}

if(instance==noone && timer==0) {
	instance=instance_create_layer(x,y,"Instances",o_veggie);
	instance.hitpoints=hitpoints;
	instance.sprite_index=sprite;
}