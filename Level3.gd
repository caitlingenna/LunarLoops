extends Node2D


# Declare member variables here. Examples:
var attempts = 0;


# Called when the node enters the scene tree for the first time.
func _ready():
	$Attempts.text = str("Attempts : ", attempts);


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func reset():
	get_node("Spaceship").pos = Vector2(500,540);
	get_node("Spaceship").launch = false;
	get_node("Spaceship").force = Vector2(0,0);
	get_node("Spaceship").velocity  = Vector2();
	get_node("ResetButton").release_focus();
	get_node("Spaceship").prevPos = Vector2();
	get_node("Spaceship").set_linear_velocity(Vector2(0,0));
	get_node("Spaceship/Spaceship_sprite").play("static");
	get_node("Moon/Sprite").play("static");
	$TryAgain/AnimatedSprite.play("static");
	attempts = attempts + 1;
	$Attempts.text = str("Attempts : ", attempts);


func _on_ResetButton_pressed():
	reset();


func _on_TryAgainButton_pressed():
	get_node("TryAgain/AnimatedSprite").play("press");
	yield($TryAgain/AnimatedSprite, "animation_finished");
	$TryAgain.visible = false
	reset();
