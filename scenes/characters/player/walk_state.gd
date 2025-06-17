extends NodeState

@onready var player: Player = $'../..'
@onready var animated_sprite_2d: AnimatedSprite2D = $'../../AnimatedSprite2D'

@export var speed: float = 50.0

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	# Update the player's position based on the direction
	var direction: Vector2 = GameInputEvents.movement_input()

	# Move the player in the specified direction
	if direction == Vector2.UP:
		animated_sprite_2d.play("walk_back")
	elif direction == Vector2.DOWN:
		animated_sprite_2d.play("walk_front")
	elif direction == Vector2.LEFT:
		animated_sprite_2d.play("walk_left")
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play("walk_right")

	# Update the player's direction
	if direction != Vector2.ZERO:
		player.player_direction = direction

	# Move the player character
	player.velocity = direction * speed
	player.move_and_slide()


func _on_next_transitions() -> void:
	if !GameInputEvents.is_moving():
		transition.emit("Idle")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	# Stop the walk animation when exiting the state
	animated_sprite_2d.stop()