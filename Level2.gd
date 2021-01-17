extends Node2D


# Declare member variables here. Examples:
var attempts = 0;


# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD/Attempts.text = str("Attempts : ", attempts);


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func reset():
	get_node("Spaceship").pos = Vector2(500,540);
	get_node("Spaceship").launch = false;
	get_node("Spaceship").force = Vector2(0,0);
	get_node("Spaceship").velocity  = Vector2();
	get_node("HUD/ResetButton").release_focus();
	get_node("Spaceship").prevPos = Vector2();
	get_node("Spaceship").set_linear_velocity(Vector2(0,0));
	get_node("Spaceship/Spaceship_sprite").play("static");
	get_node("Moon/Sprite").play("static");
	$HUD/TryAgain/AnimatedSprite.play("static");
	attempts = attempts + 1;
	$HUD/Attempts.text = str("Attempts : ", attempts);

func _on_menuButton_pressed():
	get_node("HUD/Menu").popup_centered();


func _on_ResetButton_pressed():
	reset();


func _on_NextLevel_pressed():
	get_node("HUD/PopupDialog/Sprite").play("nextLevel");
	yield($HUD/PopupDialog/Sprite, "animation_finished");
	if get_tree().change_scene("res://Level3.tscn") != OK:
		print ("An unexpected error occurred when trying to switch to Level 3 scene");

func _on_TryAgainButton_pressed():
	get_node("HUD/TryAgain/AnimatedSprite").play("press");
	yield($HUD/TryAgain/AnimatedSprite, "animation_finished");
	$HUD/TryAgain.visible = false
	reset();


func _on_LineEdit_text_changed(new_text):
	Global.moon2Name = new_text;


func _on_resume_pressed():
	$HUD/Menu.hide();
	$HUD/menuButton.release_focus();
