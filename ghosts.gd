extends CharacterBody3D

const SPEED = 3.0
const JUMP_VELOCITY = 4.5
var hero
@export var turn_speed = 4.0
@onready var nav = $NavigationAgent3D
@onready var timer = $Timer
@onready var prBar = $Sprite3D/SubViewport/ProgressBar

var healthEnemy = 10 

var is_damage_active = false

func _ready() -> void:
	hero = get_tree().get_nodes_in_group("hero")[0]
	
	timer.connect("timeout", Callable(self, "_on_damage_timeout"))
	#жесткое изменение позиции 
	position.x = 23
	position.z = 29

	
func _physics_process(delta: float) -> void:
	$faceDirection.look_at(hero.global_transform.origin, Vector3.UP)
	rotate_y(deg_to_rad($faceDirection.rotation.y * turn_speed))
	
	nav.set_target_position(hero.global_transform.origin)
	#var velocity = (nav.get_next_path_position() - transform.origin).normalized() *SPEED*delta
	velocity = (nav.get_next_path_position() - transform.origin).normalized() *SPEED*delta
	move_and_collide(velocity)

func take_damage():
	healthEnemy -= 10  # Уменьшаем здоровье врага
	prBar.value = healthEnemy  # Обновляем индикатор здоровья
	if healthEnemy <= 0:
		queue_free()  # Удаляем врага


func _on_hit_player_area_body_entered(body: Node3D) -> void:
	if body.is_in_group("hero"):
		if body.is_attacking:  # Проверяем, атакует ли игрок
			take_damage()
		elif not is_damage_active:
			apply_damage()  # Применяем урон игроку
		
func apply_damage():
	is_damage_active = true
	get_tree().call_group("hero", "hurt", 10)
	timer.start(1.0)  # Таймер запустится на 1 секунду (можно изменить)

func _on_damage_timeout():
	if is_inside_area():  # Проверяем, всё ли ещё герой в области
		apply_damage()  # Если да, наносим урон снова
	else:
		is_damage_active = false  # Иначе сбрасываем состояние

func is_inside_area() -> bool:
	var bodies = $HitPlayerArea.get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("hero"):
			return true
	return false
