extends Node2D


func _ready():
	pass
var score = 0
var killscore = 5000
func _physics_process(delta):
	if $Score.text == "Score: 15000":
		get_tree().change_scene("res://Scenes/Win.tscn")


func _on_enemy_dead():
	score = score + killscore
	var s = score
	$Score.text = "Score: " + str(s) 


func _on_Timer_timeout():
	$Objective.visible = not $Objective.visible
