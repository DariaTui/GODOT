extends Area2D
@export var speed = 60
var velocity = Vector2.ZERO

func _ready() -> void:
	velocity = Vector2.ZERO

func _process(delta: float) -> void:
	velocity = Vector2.ZERO  # Инициализируем velocity в ноль каждый кадр

	var is_moving = false  # Флаг для проверки, движется ли игрок
	var flip = 0  # Флаг для зеркального отображения спрайта

	# Проверка нажатий клавиш
	if Input.is_action_pressed("right"):
		velocity.x += 1
		flip = 1
		is_moving = true
		$AnimatedSprite2D.flip_h = false
	
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		flip = -1
		is_moving = true
		$AnimatedSprite2D.flip_h = true
	
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		is_moving = true
	
	if Input.is_action_pressed("down"):
		velocity.y += 1
		is_moving = true

	# Движение игрока
	position += velocity * delta * speed

	# Если персонаж движется, проигрываем анимацию "run", иначе "idle"
	if is_moving:
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")
	
	
