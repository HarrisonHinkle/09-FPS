extends Node2D


func _ready():
	pass





func _on_enemy_dead():
	var s = get_node("/root/Game/Enemies/enemy").score
	$Score.text = "Score: " + str(s) 
