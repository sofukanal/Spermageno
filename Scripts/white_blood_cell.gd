extends Area2D

const damage = 1

@export var horizontal_speed: float = 10.0  # Speed at which the white blood cell moves up and down
@export var horizontal_amplitude: float = 100.0  # Maximum distance (up and down) it moves
@export var vertical_speed: float = 10.0  # Speed at which the white blood cell moves up and down
@export var vertical_amplitude: float = 100.0  # Maximum distance (up and down) it moves

var base_position: Vector2 = Vector2.ZERO
var time_passed: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	base_position = position  # Store the starting position

# Called every frame
func _process(delta: float):
	time_passed += delta  # Increase the time passed

	# Create a smooth up and down motion using a sine wave (sin function)
	var horizontal_movement = sin(time_passed * horizontal_speed / 100) * horizontal_amplitude
	var vertical_movement = sin(time_passed * vertical_speed / 100) * vertical_amplitude

	# Set the position of the white blood cell to oscillate up and down
	position = base_position + Vector2(horizontal_movement, vertical_movement)

	# Optionally, add smooth horizontal movement if you want it to float left and right slowly
	# position.x = base_position.x + sin(time_passed * frequency * 0.5) * 50

func _on_white_blood_cell_area_area_entered(area):
	print("WhiteBloodCell hit player " + str(area.get_parent()))
	area.get_parent().take_damage(damage)
