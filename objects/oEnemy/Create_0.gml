/// @description Insert description here
// You can write your code in this editor
dest_x = x + 0;
dest_y = y + 0;
hsp = 0;
vsp = 0;
grv = 0.5;
walksp = 4;
dir = 1; //direction

anim = 0; //1 if anim is playing, 0 otherwise. Used when player movement is stopped
hp = 4; 

mag = -8; //distance to cover, distance to vault
stp = -32; //max height can be stepped over
vault = -64;
climb = -128; 

pistol = instance_create_depth(x,y,0,oPistolEnemy);
with (pistol) {
	self.enemy = other; 
	
}
