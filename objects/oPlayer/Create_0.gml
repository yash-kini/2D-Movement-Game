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
double_jumps = 1; //Number of jumps player can make after leaving ground