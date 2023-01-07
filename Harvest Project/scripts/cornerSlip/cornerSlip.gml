/// @function		cornerSlip(spd,vert,amount);
/// @param {real}	Speed
/// @param {bool}	Vertical
/// @param {real}	Amount
/// @description	For slipping past corners.
function cornerSlip(spd,vert,amount){
	if(vert) {
		for(var i=1; i<=amount; i++) {
			if(!place_meeting(x+spd,y-i,o_wall)) return -1;	
			if(!place_meeting(x+spd,y+i,o_wall)) return 1;
		} return 0;
	} else {
		for(var i=1; i<=amount; i++) {
			if(!place_meeting(x-i,y+spd,o_wall)) return -1;	
			if(!place_meeting(x+i,y+spd,o_wall)) return 1;
		} return 0;
	}
}