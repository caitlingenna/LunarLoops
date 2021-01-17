extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Moonshot.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Moonshot_finished():
	$Moonshot.play()
func playCrashed():
	$Crash.play();
func playMoonLanding():
	$MoonLanding.play();
