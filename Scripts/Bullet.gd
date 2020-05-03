extends Area

var speed = 20
var damage = 5
var velocity = Vector3()
func _ready():
	pass 
	
func _physics_process(delta):
	transform.origin += velocity * delta

func start(start_from):
	transform = start_from
	velocity = transform.basis.z * speed

func _on_Timer_timeout():
	queue_free()

func _on_Bullet_body_entered(body):
	if body is StaticBody:
		print("t")
		queue_free()
	if body.get_parent().name == "Objects":
		print("w")
		body.queue_free()
		queue_free()
	if body.name == "enemy":
		body.take_damage(damage)
		queue_free()
	if body.name == "enemy2":
		body.take_damage(damage)
		queue_free()
	if body.name == "enemy3":
		body.take_damage(damage)
		queue_free()
	
