extends Node

export(PackedScene) var mob_scene
export var score = 5


func _ready():
	randomize()
	$LevelMusic.play(0)
	new_game()


func game_over():
	$ScoreTimer.stop()
	$MobSpawner.stop_mob_timer()
	$UI.show_game_over()
	
	

func new_game():
	get_tree().call_group("mobs", "queue_free")
	score = 60
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$UI.set_score(score)

#func _on_ScoreTimer_timeout():
	#score += 1
	#$UI.update_score(score)

func _on_StartTimer_timeout():
	$MobSpawner.start_mob_timer()
	#$ScoreTimer.start()
	

