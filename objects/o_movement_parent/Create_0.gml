/// @description 
direction_ = 0;
speed_ = 0;
bounce_amount_ = 0;
touching_ground = false;
target_speed = 0;
gravity_y_add = 0; //z_
gravity_speed_ = 0;//z_speed_
gravity_ = 0.2;
jump_force = 0;

up = 0;
down = 0;
right = 0;
left = 0;


angle = 0;
xscale = 1;
yscale = 1;

enable_gravity = true;


trigger_winstate = false;

invincible = false;
invincible_timer = 0;

function jump(){ 
	gravity_speed_ = 0;
	gravity_y_add = 0;
	jump_force = 7;
}

#region invincible shader init

_uniUV         = shader_get_uniform(shd_rainbow, "u_uv");
_uniTime       = shader_get_uniform(shd_rainbow, "u_time");
_uniSpeed      = shader_get_uniform(shd_rainbow, "u_speed");
_uniSection    = shader_get_uniform(shd_rainbow, "u_section");
_uniSaturation = shader_get_uniform(shd_rainbow, "u_saturation"); 
_uniBrightness = shader_get_uniform(shd_rainbow, "u_brightness");
_uniMix        = shader_get_uniform(shd_rainbow, "u_mix");

_time  = 0;
_speed = 1.0;
_section = 0.5;
_saturation = 0.7;
_brightness = 0.8;
_mix = 0.5;

#endregion