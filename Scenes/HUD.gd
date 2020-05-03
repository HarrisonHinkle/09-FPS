extends Node2D


func _ready():
	pass


func _physics_process(delta):
	if $Score.text == "Score: 5000":
		get_tree().change_scene("res://Scenes/Win.tscn")


func _on_enemy_dead():
	var s = get_node("/root/Game/Enemies/enemy").score
	$Score.text = "Score: " + str(s) 


func _on_Timer_timeout():
	$Objective.visible = not $Objective.visible
