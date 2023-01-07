/// @function		approach(start,target,step);
/// @param			start
/// @param			target
/// @param			step
/// @description	Start value approaches target value by step amount.

function approach(start,target,step) {
	if(start<target) {
		start+=step;
		if(start>target) return target;
	} else {
		start-=step;
		if(start<target) return target;
	}
	return start;
}