extends Control

func _ready() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()


func _process(delta: float) -> void:
	pass
	## Проверяем, нажата ли клавиша Esc
	#if Input.is_action_just_pressed("esc"):
		#load_control_menu()
#
#func load_control_menu() -> void:
	## Загружаем сцену controlMenu.tscn
	#var control_menu = load("res://controlMenu.tscn")
	#if control_menu:
		#get_tree().change_scene_to_packed(control_menu)
	#else:
		#print("Ошибка: Не удалось загрузить сцену res://controlMenu.tscn")
