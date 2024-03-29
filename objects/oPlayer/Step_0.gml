/// @description Insert description here

//Player Input
key_left = keyboard_check(ord("A")); //if key is held down
key_right = keyboard_check(ord("D")); 
key_jump = keyboard_check_pressed(vk_space); //if key was pressed on the frame



//Calculate Movement
var ground; //if touching ground
var trampo; //if touching trampoline
var move = key_right - key_left;
vsp += grv;
if (place_meeting(x, y+10, oWall)){
	ground = 1; 
	hsp = move * walksp;
}
else { //slow down movement if not touching ground
	ground = 0
	hsp = move * walksp*.75;
}

if (place_meeting(x, y+60, oTrampoline)){
	trampo = 1;
}
else {
	trampo = 0;
}


//Horizontal Collision
if (place_meeting(x+hsp, y, oWall)) {
	while (!place_meeting(x+sign(hsp), y, oWall)) {
		x += sign(hsp);
	}
	//Step
	if (!place_meeting(x+hsp, y +stp, oWall)){
		y += stp; 
		x += (-dir)*mag/2;
	}
	hsp = 0;
}

//Jump
if(ground && key_jump && not trampo){
	vsp = -12;
}

//Double Jump
if(not ground && key_jump && not trampo && double_jumps > 0){
	vsp = -12;
	double_jumps--;
}
if (ground) {
	double_jumps = 1; //reset double jump after player touches ground
}

//Trampoline Jump
if(place_meeting(x, y+32, oTrampoline) && key_jump){
	if (abs(vsp) >= 6){
		vsp *= -1.5;
	}
	else { 
		vsp = -12; 
	}
}

//Trampoline
if(place_meeting(x, y+vsp, oTrampoline)){
	if(abs(vsp) >= 6){
		if(first_bounce){
			vsp *= -1.5;
			first_bounce = 0;
		}
		else {
			vsp *= -.7;
			hsp = move*20;
		}
	}
	else {
		first_bounce = 1;
	}
	
}

//Vault
if(!anim) {
	if (place_meeting(x+(-dir)*mag, y , oWall)){
		if (!place_meeting(x+(-dir)*mag, y +vault, oWall) && (key_jump) && (ground)){
				alarm_set(0, 15);
				sprite_index = sPlayerV; 
				anim = 1; 
			}
	}
}
//Vertical Collision
if (place_meeting(x, y+vsp, oWall)) {
	while (!place_meeting(x, y+sign(vsp), oWall)) {
		y += sign(vsp);
	}
	vsp = 0;
}

//Animation
if (!anim) {
if (hsp != 0) dir = sign(hsp);
image_xscale = dir; 
if (hsp == 0 && vsp == 0) {
	sprite_index = sPlayer;
	//Cover
	if (place_meeting(x+mag*(-dir), y+stp, oWall)) {
		sprite_index = sPlayerC;
	}
}
	if (hsp != 0) {
		sprite_index = sPlayerR; 
	}
	if (vsp != 0) {
		sprite_index = sPlayerA; 
		if (vsp > 0) {
			image_index = 1;
		} 
		else {
			image_index = 0;
		}
	}
	//Apply Movement
		x += hsp;
		vsp = sign(vsp)*min(abs(vsp), max_vsp);
		y += vsp;
}