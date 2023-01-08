if(!dead) {
	draw_self();
} else {
	//Draw the sprite using the shader, that's it!
	dissolve_shader(sprite_index,image_index,x,y,dissolveAmount);
}