extends Area2D

# Add an exported variable to set the audio file
@export var audio_file: AudioStream

# Declare a reference to the AudioStreamPlayer node
@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer

var have_played = false

func _ready():
	# Assign the audio file to the AudioStreamPlayer
	if audio_file:
		audio_player.stream = audio_file
	else:
		print("No audio file assigned to the AudioPlayer.")

# Trigger when the player enters the area
func _on_area_entered(area):
	if !have_played:
		if area.name == "Player group?":  # Ensure the player is entering the area
			play_audio()

# Function to play the audio
func play_audio():
	have_played = true
	if not audio_player.playing:  # Play only if not already playing
		audio_player.play()
