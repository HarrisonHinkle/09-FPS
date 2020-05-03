extends KinematicBody

var state = ""
var speed = 1
var health = 20
var Bullet = preload("res://Scenes/Enemyfire.tscn")
signal dead
onready var Scan = $Scanner
var score = 0

func take_damage(d):
	health -= d
	if health <= 0:
		emit_signal("dead")
		queue_free()
	

func change_state(s):
	state = s

func _ready():
	change_state("searching")

func _physics_process(delta):
	if state == "searching":
		rotate(Vector3(0,1,0), speed * delta)
		var c = Scan.get_collider()
		if c != null and c.name == 'Player':
			change_state("found")
	if state == "found":
		change_state("wait")
		$Timer.start()
	if state == "shoot":
		var b = Bullet.instance()
		b.start($Muzzle.global_transform)
		get_node("/root/Game/EnemyTimer").add_child(b)
		change_state("shoot_waiting")

func _on_Timer_timeout():
	var c = Scan.get_collider()
	if c != null and c.name == 'Player':
		if state == "wait":
			change_state("shoot")
		if state == "shoot_waiting":
			change_state("shoot")
	else:
		change_state("searching")

