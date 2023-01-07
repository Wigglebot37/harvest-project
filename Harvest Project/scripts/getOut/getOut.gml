/// @function		getOut(precision);
/// @param {real}	precision
/// @description	For escaping objects
function getOut(precision) {
	if(place_meeting(x,y,o_wall)) {
		var curRad=precision;
		var startX=x;
		var startY=y;
		while(true) {
			for(var _x=-curRad; _x<=curRad; _x+=precision) {
				for(var _y=-curRad; _y<=curRad; _y+=precision) {
					if(_x>curRad && _y>curRad && _x<curRad && _y<curRad) continue;
					x=startX+_x; 
					y=startY+_y;
					if(!place_meeting(x,y,o_wall)) {
						log("Got out after "+string(curRad/precision)+" iterations.");
						return;
					}
				}
			}
			curRad+=precision;
		}
	}
}