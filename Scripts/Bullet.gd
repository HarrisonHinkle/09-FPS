extends Area

var speed = 20
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

func _bullet_contact(body):
	if body is StaticBody:
		queue_free()
	if body.get_parent().name == "Items":
		body.queue_free()
		queue_free()
	
