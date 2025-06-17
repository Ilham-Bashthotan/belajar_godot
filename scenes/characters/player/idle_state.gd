extends NodeState

@onready var player: Player = $'../..'
@onready var animated_sprite_2d: AnimatedSprite2D = $'../../AnimatedSprite2D'

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	# Move the player in the specified direction
	if player.player_direction == Vector2.UP:
		animated_sprite_2d.play("idle_back")
	elif player.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("idle_front")
	elif player.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("idle_left")
	elif player.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("idle_right")
	else:
		animated_sprite_2d.play("idle_front")


func _on_next_transitions() -> void:
	GameInputEvents.movement_input()

	if GameInputEvents.is_moving():
		transition.emit("Walk")

	# Check if the player is using a tool
	if player.current_tool == DataTypes.Tools.AxeWood && GameInputEvents.use_tool():
		transition.emit("Chopping")

	if player.current_tool == DataTypes.Tools.TillGround && GameInputEvents.use_tool():
		transition.emit("Tilling")

	if player.current_tool == DataTypes.Tools.WaterCrops && GameInputEvents.use_tool():
		transition.emit("Watering")

func _on_enter() -> void:
	pass


func _on_exit() -> void:
	# Stop the idle animation when exiting the state
	animated_sprite_2d.stop()
