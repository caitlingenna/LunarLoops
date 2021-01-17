extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_TryAgain_about_to_show():
	get_node("/root/Audio").playCrashed();


func _on_PopupDialog_about_to_show():
	get_node("/root/Audio").playMoonLanding();
