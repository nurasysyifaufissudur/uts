extends Area2D
class_name enemy

@export var speed = 2
@onready var explosion_prefab= preload("res://prefabs/explosion.tscn")
@onready var laser_prefab = preload("res://prefabs/enemy_laser.tscn")
signal enemy_killed
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed
	

func _on_area_entered(area):
	if area is laser:
		var explosion = explosion_prefab.instantiate()
		explosion.position = position
		get_parent().add_child(explosion)
		queue_free()
		area.queue_free()
		enemy_killed.emit()
	

func _on_laser_spawn_timer_timeout() -> void:
	var laser = laser_prefab.instantiate()
	laser.position = position
	get_parent().add_child(laser)
