extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Global").Update_Score(0)

func _unhandled_input(event):
	if Input.is_action_pressed("quit"):
		get_tree().quit()
