extends Control

# Drag your next scene (PackedScene) here in the inspector
@export var next_scene: PackedScene = preload("res://Levels/Level1.tscn")

@onready var audio_player = $AudioStreamPlayer
@onready var label = $TextLabel

@onready var timer1 = $Timer1
@onready var timer2 = $Timer2
@onready var timer3 = $Timer3
@onready var timer4 = $Timer4
@onready var timer5 = $Timer5
@onready var timer6 = $Timer6
@onready var timer7 = $Timer7
@onready var timer8 = $Timer8
@onready var timer9 = $Timer9
@onready var timer10 = $Timer10
@onready var timer11 = $Timer11

func _ready():
	# Start the cutscene by playing audio and setting the initial text
	audio_player.play()
	label.text = ""
	
	timer1.start()
	timer2.start()
	timer3.start()
	timer4.start()
	timer5.start()
	timer6.start()
	timer7.start()
	timer8.start()
	timer9.start()
	timer10.start()
	timer11.start()


func _on_audio_stream_player_finished():
	if next_scene:
		get_tree().change_scene_to_packed(next_scene)


func _on_timer_1_timeout():
	label.text = "Welcome to the beginning of an incredible journey..."


func _on_timer_2_timeout():
	label.text = "You are a single cell"


func _on_timer_3_timeout():
	label.text = "one of millions.."


func _on_timer_4_timeout():
	label.text = "The goal?"


func _on_timer_5_timeout():
	label.text = "To find the egg!"


func _on_timer_6_timeout():
	label.text = "the spark of new life!!"


func _on_timer_7_timeout():
	label.text = "Against all odds.."


func _on_timer_8_timeout():
	label.text = "only 1 can succeed!"


func _on_timer_9_timeout():
	label.text = "This is your one chance!"


func _on_timer_10_timeout():
	label.text = ""


func _on_timer_11_timeout():
	label.text = "So get the fuck up and GO!!"
