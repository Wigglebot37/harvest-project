if(timer>0) timer-=0.01;

if(timer==0 && !paused) {
	if(maxEnemies>0) {
		instance=instance_create_layer(x,y,"Instances",o_enemy);
		maxEnemies--;
		instance.armored=armored;
		instance.image_index=index;
		timer=10;
	} else if(!instance_exists(o_enemy)) {
		gameWon=true;
	}
}