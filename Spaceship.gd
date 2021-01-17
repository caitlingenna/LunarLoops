extends RigidBody2D

# Declare member variables here. Examples:
var force = Vector2(0,0);
var velocity  = Vector2();
var pos = Vector2(500,540);
var prevPos = Vector2();
var launch = false;
var cleared = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	#var offset = Vector2(0,-50);
	#apply_impulse(velocity, velocity);
	#set_axis_velocity(offset);
	#set_linear_velocity(offset);
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if launch == false:
		if Input.is_action_just_pressed("ui_accept"):
			var offset = Vector2(0,-70);
			apply_impulse(velocity, velocity);
			launch = true;
			set_axis_velocity(offset);
			$Spaceship_sprite.set_frame(0);
			$Spaceship_sprite.play("launch");
		#set_linear_velocity(offset);
		
		#velocity.y += -20;
	#velocity = move_and_slide(velocity);
func _integrate_forces(state):
	if launch == false:
		prevPos = pos;
		if Input.is_action_pressed("ui_left"):
			pos.x += -1.5;
		if Input.is_action_pressed("ui_right"):
			pos.x += 1.5;
		state.transform = Transform2D(pos, pos, prevPos);


func _on_Spaceship_body_entered(body):
	if (body.get_name() == "Goal"):
		$Spaceship_sprite.play("land");
		var goal_pos= Vector2();
		var ship_pos = Vector2();
		goal_pos = get_node("/root/Level1/Moon/Goal").position;
		ship_pos = $Spaceship_sprite.position;
		transform = Transform2D(goal_pos, goal_pos, ship_pos);
		yield($Spaceship_sprite, "animation_finished");
		get_node("/root/Level1/Moon/Sprite").play("goal");
		get_node("/root/Level1/PopupDialog").popup_centered();
		cleared = true;
	if (body.get_name() == "Crash" && cleared == false):
		get_node("/root/Level1/TryAgain").popup_centered();
