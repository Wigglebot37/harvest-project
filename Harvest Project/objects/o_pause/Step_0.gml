/// @description Calls Fullscreen
// Alt+Enter triggers fullscreen
if(keyboard_check(vk_alt) && keyboard_check_pressed(vk_enter)) {
	fullscreen();
}

// Increments shader transitions
if(paused) {
	mono=approach(mono,0,0.04);
	blur=approach(blur,2,0.1);
	inv=approach(inv,1,0.04);
}