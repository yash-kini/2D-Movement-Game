function scr_moveTo(argument0, argument1) {
	x_=argument0 
	id_ =argument1  

	while (id_.x != x_) {
		scr_moveClimb(x_, id_)
	}


}
