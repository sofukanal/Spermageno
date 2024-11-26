extends Area2D

const damage = 1

# Define ranges for random size and speed
@export_range(0.5, 2.0) var min_scale_amplitude: float = 0.5
@export_range(0.5, 2.0) var max_scale_amplitude: float = 1.5
@export_range(0.5, 3.0) var min_scale_speed: float = 0.5
@export_range(0.5, 3.0) var max_scale_speed: float = 2.0

var scale_speed: float = 1.0  # Speed of the scaling animation
var scale_amplitude: float = 0.5  # Maximum scale variation

var time_passed: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	# Choose random values for scale amplitude and speed
	scale_amplitude = randf_range(min_scale_amplitude, max_scale_amplitude)
	scale_speed = randf_range(min_scale_speed, max_scale_speed)
	scale = Vector2.ONE

# Called every frame
func _process(delta: float):
	time_passed += delta  # Increase the time passed

	# Calculate the scale factor using a sine wave (sin function)
	var scale_factor = 1.0 + sin(time_passed * scale_speed) * scale_amplitude

	# Set the new scale for the sprite
	scale = Vector2.ONE * scale_factor

func _on_chlamydia_cell_area_area_entered(area):
	print("ChlamydiaCell hit player " + str(area.get_parent()))
	area.get_parent().take_damage(damage)
