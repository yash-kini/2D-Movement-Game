/// @description Insert description here

max_vsp = 25;
grv = 0.5;
walksp = 8;
dir = 1; //direction

hp = 1000;


mag = -32 //distance to cover, distance to vault
stp = -32; //max height can be stepped over
vault = -64;
climb = -128; 

//Required Variables, Do not change these
anim = 0; //1 if anim is playing, 0 otherwise. Used when player movement is stopped
hsp = 0;
vsp = 0;
first_bounce = 1; //If this is the first bounce a user has made on trampoline 


/// @description Insert description here
//Defined Values
swing_speed = 2;
grv = .1;
launch_speed = 5;
hp = 4;
climb_speed = 3;



//needs to be set by previous state
hook = -1; // Id of hook attached to, 
hook_angle = -1 // angle of line rope from player to hook
hook_distance = 0 // distance from player to hook
show_debug_message("HOOK standing: "+string(hook));

if (hook_angle > 90 && hook_angle < 270) {
	swing_speed*= -1;
}
