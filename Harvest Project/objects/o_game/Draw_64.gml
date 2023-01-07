if(room!=rm_menu) exit;

draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_text_transformed(win_w/2,win_h/3,"Suction Destruction",sign(angle)*angle/10+2,sign(angle)*angle/10+2,angle);
draw_text(win_w/2,win_h*4/7,"Press Space to Start.");