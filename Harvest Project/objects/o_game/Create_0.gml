/// @description Creates some global variables
#macro UP_LEFT 135
#macro UP 90
#macro UP_RIGHT 45
#macro RIGHT 0
#macro DOWN_RIGHT 315
#macro DOWN 270
#macro DOWN_LEFT 225
#macro LEFT 180
globalvar paused;
paused=false;

mapstring=" 0123456789AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz.!?,'()&:;/%#\"$*+-=<>[]^_{}|\\~";
globalvar fnt_pixel,fnt_tiny;
fnt_pixel=font_add_sprite_ext(sp_fontbig,mapstring,true,3);
fnt_tiny=font_add_sprite_ext(sp_tinyfontbig,mapstring,true,3);
draw_set_font(fnt_pixel);