extends Node2D


@onready var hurt_component: HurtComponent = $Sprite2D/HurtComponent
@onready var damage_component: DamageComponent = $Sprite2D/DamageComponent
var log_scene: PackedScene = preload("res://scenes/objects/trees/log.tscn")

func _ready() -> void:
    hurt_component.hurt.connect(on_hurt)
    damage_component.max_damage_reached.connect(on_max_damage_reached)


func on_hurt(hit_damage: int) -> void:
    damage_component.apply_damage(hit_damage)


func on_max_damage_reached() -> void:
    call_deferred("add_log_scene")
    print("Max damage reached for large tree")
    queue_free()


func add_log_scene() -> void:
    var log_instance: Node2D = log_scene.instantiate()
    log_instance.global_position = global_position
    get_parent().add_child(log_instance)