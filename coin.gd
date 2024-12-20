extends Area3D

const ROT_SPEED = 2 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#connect("body_entered", Callable(self, "_on_body_entered")) 
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_y(deg_to_rad(ROT_SPEED))

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("hero"):  # Проверяем, что столкновение произошло с игроком
		emit_signal("coin_collected", body)  # Уведомляем игрока
		queue_free()  # Удаляем монету
	