extends ColorRect

@export var target_opacity: float = 0
@export var duration: float = 3.0

# Called when the node enters the scene tree for the first time.
func _ready():
	# Start a tween for the opacity modulation when the scene starts.
	var tween := create_tween()
	tween.tween_property(self, "modulate:a", target_opacity, duration)
