extends PopupDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$ScrollContainer/HBoxContainer/Level1/nametag.text = Global.moon1Name;
	$ScrollContainer/HBoxContainer/Level2/nametag.text = Global.moon2Name;
	$ScrollContainer/HBoxContainer/Level3/nametag.text = Global.moon3Name;
	$ScrollContainer/HBoxContainer/Level4/nametag.text = Global.moon4Name;
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_menuButton_pressed():
	popup_centered();

