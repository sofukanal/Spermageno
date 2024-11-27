extends Node2D

# Add an exported variable to set the audio file
@export var audio_file: AudioStream

# Declare a reference to the AudioStreamPlayer node
@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer

var have_played = false

func _ready():
	# Assign the audio file to the AudioStreamPlayer
	if audio_file:
		audio_player.stream = audio_file
		print(audio_file)
	else:
		print("No audio file assigned to the AudioPlayer.")



func _on_activator_area_area_entered(area: Area2D) -> void:
	print("SOUND: Activated.")
	if !have_played:
		print("SOUND: Have not played.")
		play_audio()

# Function to play the audio
func play_audio():
	have_played = true
	if audio_player.stream:
		if not audio_player.is_playing():
			audio_player.play()
			print("SOUND: Audio is playing.")
		else:
			print("SOUND: Audio is already playing.")
	else:
		print("SOUND: No audio stream assigned to AudioStreamPlayer.")
