function scr_pickCover(argument0) {
	enemy = argument0;
	var j;
	for (j = 0; j < instance_number(oCoverL); j += 1) {
		leftCover[j] = instance_nth_nearest(oPlayer.x, oPlayer.y, oCoverL, j);
	}
	var k;
	for (k = 0; k < instance_number(oCoverR); k += 1) {
		rightCover[k] = instance_nth_nearest(oPlayer.x, oPlayer.y, oCoverR, k);
	}

	var l; 
	var lcount = 0;
	var rcount = 0;
	for (l = 0; l < instance_number(oEnemy); l += 1) {
		if (oPlayer.x > leftCover[lcount].x) { 
			lcount += 1; 
			enemy[l].dest_x = leftCover[lcount].x-48;
			enemy[l].dest_y = leftCover[lcount].y;
		
		} else {
			rcount += 1;
			enemy[l].dest_x = rightCover[rcount].x+48;
			enemy[l].dest_y = rightCover[rcount].y;
		}
	}



}
