extends Node3D

const ROT_SPEED = 2 #градусы на которые поворачивается монета в каждом кадре

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_y(deg_to_rad(ROT_SPEED))
	
#при столкновении монета пропадет
func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("hero"):  # Проверяем, игрок ли это
		emit_signal("coin_collected", body)  # Уведомляем о сборе монеты
		queue_free()  # Удаляем монету
