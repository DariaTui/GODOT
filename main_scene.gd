extends Node3D

@onready var player = $RootScene

func _physics_process(delta: float) -> void:
	get_tree().call_group("enemies","update_target_location", player.global_transform.origin)

func pressEsc():
	if Input.is_action_just_pressed("esc"):
		
		var control_menu = load("res://controlMenu.tscn")  # Загружаем сцену как PackedScene
		if control_menu:  # Проверяем, что сцена успешно загружена
			get_tree().change_scene_to_packed(control_menu)
		else:
			print("Ошибка: Не удалось загрузить сцену res://main_scene.tscn")
