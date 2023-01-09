draw_set_halign(fa_center);
draw_set_valign(fa_center);
var text="GAME OVER";
if(gameWon) text="You WON!";
if(gameOver || gameWon) {
	draw_text_transformed(win_w/2,win_h/3,text,4,4,0);
	draw_text(win_w/2,win_h*4/7,"Press R to Restart.");
} else if(paused) {
	draw_text_transformed(win_w/2,win_h/3,"Controls",2,2,0);
	draw_text(win_w/2,win_h*4/7,"WASD to move");
	draw_text(win_w/2,win_h*5/7,"Left Click to Suck, Right Click to Blow");
}