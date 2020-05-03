extends KinematicBody

var state = ""
var speed = 1
onready var Scan = $Scanner

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
		pass


func _on_Timer_timeout():
	var c = Scan.get_collider()
	
