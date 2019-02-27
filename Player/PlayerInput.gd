extends Node

class_name PlayerInput

#warning-ignore:unused_class_variable
var Left setget ,get_left;
func get_left(): return Input.is_action_pressed("move_left");

#warning-ignore:unused_class_variable
var Right setget ,get_right;
func get_right(): return Input.is_action_pressed("move_right");

#warning-ignore:unused_class_variable
var Jump setget ,get_jump;
func get_jump(): return Input.is_action_pressed("move_jump");

#warning-ignore:unused_class_variable
var Fall setget ,get_fall;
func get_fall(): return !Input.is_action_pressed("move_jump");

#warning-ignore:unused_class_variable
var Attack setget ,get_attack;
func get_attack(): return Input.is_action_just_pressed("attack_weapon");