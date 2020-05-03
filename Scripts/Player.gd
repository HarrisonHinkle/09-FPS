extends KinematicBody


onready var Camera = $Head/Camera

var Bullet = preload("res://Scenes/Bullet.tscn")
var velocity = Vector3()
var gravity = -9.8
var speed  = 8
var mouse_sensitivity = 0.002
var mouse_range = 1.2
var jump = 4
var jumping = false
func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass
	
func get_input():
	var input_dir = Vector3()
	if Input.is_action_pressed("forward"):
		input_dir += -Camera.global_transform.basis.z
	if Input.is_action_pressed("back"):
		input_dir += Camera.global_transform.basis.z
	if Input.is_action_pressed("left"):
		input_dir += -Camera.global_transform.basis.x
	if Input.is_action_pressed("right"):
		input_dir += Camera.global_transform.basis.x
	if Input.is_action_pressed("jump"):
		jumping = true
	input_dir = input_dir.normalized()
	
	return input_dir

func _physics_process(delta):
	velocity.y += gravity * delta
	var desire_velocity = get_input() * speed
	
	velocity.x = desire_velocity.x
	velocity.z = desire_velocity.z
	if jumping == true and is_on_floor():
		velocity.y = jump
	jumping = false
	velocity = move_and_slide(velocity, Vector3.UP, true)

		

# warning-ignore:unused_argument
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		$Head.rotate_x(-event.relative.y * mouse_sensitivity)
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Head.rotation.x = clamp($Head.rotation.x, -mouse_range, mouse_range)
	if event.is_action_pressed("shoot"):
		var b = Bullet.instance()
		b.start($Head/Muzzle.global_transform)
		get_node("/root/Game/Bullets").add_child(b)
		