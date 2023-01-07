/// @description Insert description here
if(angleswitch) angle+=0.25;
else angle-=0.25;
if(angle>=10) angleswitch=false;
else if(angle<=-10) angleswitch=true;

if(room==rm_menu && keyboard_check_pressed(vk_space)) room_goto(rm_start);

if(!gameWon && !instance_exists(o_enemy) && !gameOver && room==rm_start) gameWon=true;

if(!gameOver && !gameWon) exit;
if(keyboard_check_pressed(ord("R"))) game_restart();
//else if(keyboard_check_pressed(ord("S"))) save_game();
//else if(keyboard_check_pressed(ord("L"))) load_game();
//else if(keyboard_check_pressed(ord("D"))) delete_save();*/