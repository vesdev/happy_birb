/// @description 
/// @description 

//handles button inputs


up = keyboard_check(up_key) or keyboard_check(vk_up);
right = keyboard_check(right_key) or keyboard_check(vk_right);
left = keyboard_check(left_key) or keyboard_check(vk_left);
down = keyboard_check(down_key) or keyboard_check(vk_down);


// Menu Navigation input

up_pressed = keyboard_check_pressed(up_key) or keyboard_check_pressed(vk_up);
right_pressed = keyboard_check_pressed(right_key) or keyboard_check_pressed(vk_right);
left_pressed = keyboard_check_pressed(left_key) or keyboard_check_pressed(vk_left);
down_pressed = keyboard_check_pressed(down_key) or keyboard_check_pressed(vk_down);



//Action and back input
action = keyboard_check_pressed(action_key);
back = keyboard_check_pressed(back_key);
extra = keyboard_check_pressed(vk_enter);
restart_key = keyboard_check_pressed(restart_key);
bomb = keyboard_check_pressed(bomb_key);
badge = keyboard_check(badge_key);

//Action and back pressed input
action_check = keyboard_check(action_key);
back_check = keyboard_check(back_key);
extra_check = keyboard_check(vk_enter);
bomb_check = keyboard_check(bomb_key);
badge_check = keyboard_check(badge_key);

select = noone;

//if !instance_exists(o_level_up){
//misc
//Disables pause if shop is present

pause_pressed = keyboard_check_pressed(pause_key);


m1_check = mouse_check_button(mouse_key);
m2_check = mouse_check_button(mouse_key_2);

m1_pressed = mouse_check_button_pressed(mouse_key);
m2_pressed = mouse_check_button_pressed(mouse_key_2);

m1_release = mouse_check_button_released(mouse_key);
m2_release = mouse_check_button_released(mouse_key_2);


weapon_swap = keyboard_check_pressed(ord("Q"));

interact = keyboard_check_pressed(ord("E"));
interact_check = keyboard_check(ord("E"));
interact_release = keyboard_check_released(ord("E"));
