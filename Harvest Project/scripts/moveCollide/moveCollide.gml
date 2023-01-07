/// @function moveCollide(dir,spd);
/// @param {real}	dir
/// @param {real}	spd
function moveCollide(dir,spd) {
	var newDir=dir;
	var newSpd=spd;
	var corner=0;
	var dist=spd+1;
	
	// Pushing player out of colliding objects
	getOut(2);
	
	// Checking on diagonal movement
	if(dir==UP_LEFT && place_meeting(x-dist,y-dist,o_wall)) {
		if(place_meeting(x-dist,y-dist,o_wallDR)) newSpd=0;
		else {
			var check1=place_meeting(x-dist,y,o_wall);
			var check2=place_meeting(x,y-dist,o_wall);
			if(check1 && !check2) newDir=UP;
			else if(!check1 && check2) newDir=LEFT;
			else newSpd=0;
		}
	} else if(dir==UP_RIGHT && place_meeting(x+dist,y-dist,o_wall)) {
		if(place_meeting(x+dist,y-dist,o_wallDL)) newSpd=0;
		else {
			var check1=place_meeting(x+dist,y,o_wall);
			var check2=place_meeting(x,y-dist,o_wall);
			if(check1 && !check2) newDir=UP;
			else if(!check1 && check2) newDir=RIGHT;
			else newSpd=0;
		}
	} else if(dir==DOWN_RIGHT && place_meeting(x+dist,y+dist,o_wall)) {
		if(place_meeting(x+dist,y+dist,o_wallUL)) newSpd=0;
		else {
			var check1=place_meeting(x+dist,y,o_wall);
			var check2=place_meeting(x,y+dist,o_wall);
			if(check1 && !check2) newDir=DOWN;
			else if(!check1 && check2) newDir=RIGHT;
			else newSpd=0;
		}
	} else if(dir==DOWN_LEFT && place_meeting(x-dist,y+dist,o_wall)) {
		if(place_meeting(x-dist,y+dist,o_wallUR)) newSpd=0;
		else {
			var check1=place_meeting(x-dist,y,o_wall);
			var check2=place_meeting(x,y+dist,o_wall);
			if(check1 && !check2) newDir=DOWN;
			else if(!check1 && check2) newDir=LEFT;
			else newSpd=0;
		}
		
	// Checking on non-diagonal movement
	} else if(dir==UP && place_meeting(x,y-dist,o_wall)) {
		if(place_meeting(x,y-dist,o_wallDR) && !place_meeting(x+dist,y-dist,o_wall)) newDir=UP_RIGHT;
		else if(place_meeting(x,y-dist,o_wallDL) && !place_meeting(x-dist,y-dist,o_wall)) newDir=UP_LEFT;
		else {
			var meet=place_meeting(x,y-spd,o_wallFlat);
			if(place_meeting(x,y-spd,o_wallDR) && !meet) newDir=UP_RIGHT;
			else if(place_meeting(x,y-spd,o_wallDL) && !meet) newDir=UP_LEFT;
			else {
				corner=cornerSlip(-dist,false,16);
				switch(corner) {
					case 1: newDir=RIGHT; break;
					case -1: newDir=LEFT; break;
					default: newSpd=0;
				}
			}
		}
	} else if(dir==RIGHT && place_meeting(x+dist,y,o_wall)) {
		if(place_meeting(x+dist,y,o_wallUL) && !place_meeting(x+dist,y-dist,o_wall)) newDir=UP_RIGHT;
		else if(place_meeting(x+dist,y,o_wallDL) && !place_meeting(x+dist,y+dist,o_wall)) newDir=DOWN_RIGHT;
		else {
			var meet=place_meeting(x+spd,y,o_wallFlat);
			if(place_meeting(x+spd,y,o_wallUL) && !meet) newDir=UP_RIGHT;
			else if(place_meeting(x+spd,y,o_wallDL) && !meet) newDir=DOWN_RIGHT;
			else {
				corner=cornerSlip(dist,true,16);
				switch(corner) {
					case 1: newDir=DOWN; break;
					case -1: newDir=UP; break; 
					default: newSpd=0;
				}
			}
		}
	} else if(dir==LEFT && place_meeting(x-dist,y,o_wall)) {
		if(place_meeting(x-dist,y,o_wallUR) && !place_meeting(x-dist,y-dist,o_wall)) newDir=UP_LEFT;
		else if(place_meeting(x-dist,y,o_wallDR) && !place_meeting(x-dist,y+dist,o_wall)) newDir=DOWN_LEFT;
		else {
			var meet=place_meeting(x-spd,y,o_wallFlat);
			if(place_meeting(x-spd,y,o_wallUR) && !meet) newDir=UP_LEFT;
			else if(place_meeting(x-spd,y,o_wallDR) && !meet) newDir=DOWN_LEFT;
			else {
				corner=cornerSlip(-dist,true,16);
				switch(corner) {
					case 1: newDir=DOWN; break;
					case -1: newDir=UP; break;
					default: newSpd=0;
				}
			}
		}
	} else if(dir==DOWN && place_meeting(x,y+dist,o_wall)) {
		if(place_meeting(x,y+dist,o_wallUR) && !place_meeting(x+dist,y+dist,o_wall)) newDir=DOWN_RIGHT;
		else if(place_meeting(x,y+dist,o_wallUL) && !place_meeting(x-dist,y+dist,o_wall)) newDir=DOWN_LEFT;
		else {
			var meet=place_meeting(x,y+spd,o_wallFlat);
			if(place_meeting(x,y+spd,o_wallUR) && !meet) newDir=DOWN_RIGHT;
			else if(place_meeting(x,y+spd,o_wallUL) && !meet) newDir=DOWN_LEFT;
			else {
				corner=cornerSlip(dist,false,16);
				switch(corner) {
					case 1: newDir=RIGHT; break;
					case -1: newDir=LEFT; break;
					default: newSpd=0;
				}
			}
		}
	}
	
	speed=newSpd;
	direction=newDir;
}