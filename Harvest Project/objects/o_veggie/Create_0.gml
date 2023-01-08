/// @description Insert description here
sprite_index=sp_carrot;
image_speed=0;
lifetime=80;
caught=false;

hitpoints=3;
dead=false;

dissolveAmount = 1;
col1 = make_color_rgb(0.8*255,0,0);
col2 = make_color_rgb(255,0.55*255,0);

//Call this once in your object before using the shader script
col1 = make_color_rgb(0.8*255,0,0);
col2 = make_color_rgb(255,0.55*255,0);
dissolve_settings(sp_dissolve3,0,col1,col2,0.2);