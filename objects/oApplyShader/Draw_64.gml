/// @description Insert description here
// You can write your code in this editor

shader_set(shScreen);

shader_set_uniform_f(uni_grain_time, (0.000001*current_time) mod 1);
shader_set_uniform_f(uni_grain_intensity, -0.075);
shader_set_uniform_f(uni_bloom_intensity, .3);
shader_set_uniform_f(uni_blurSize, (1.0/64.0));

draw_surface(application_surface,0,0);
shader_reset();
