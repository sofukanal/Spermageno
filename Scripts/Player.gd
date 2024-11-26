extends CharacterBody2D

# Placeholder values for speed, rotation and health
const max_speed = 450.0
const acceleration = 250.0
const deceleration = 40.0
const brake_deceleration = 200.0  # Faster deceleration when pressing down
const rotation_speed = 2.0
const rotation_speed_minimum = 0.2
const bounce_factor = 0.5
const max_health = 3;

# Placeholder values for health
var health = max_health
var is_dead = false

# Variables (onready)
@onready var animated_player_sprite = $AnimatedBody
@onready var animated_health_sprite = $PlayerUI/AnimatedHealth2D
@onready var hurt_sound = $HurtAudio
@onready var die_sound = $DieAudio


# Called when the node enters the scene tree for the first time
func _ready():
	# Get the AnimatedSprite2D node and start playing the animation
	animated_player_sprite.play()
	animate_health()

func _physics_process(delta):
	if !is_dead:
		# Get input
		var move_up = Input.is_action_pressed("ui_up")
		var move_down = Input.is_action_pressed("ui_down")
		var turn_left = Input.is_action_pressed("ui_left")
		var turn_right = Input.is_action_pressed("ui_right")
		
		# Adjust rotation based on speed
		if turn_left and not turn_right:
			rotation -= rotation_speed * (velocity.length() / max_speed + rotation_speed_minimum) * delta
		elif turn_right and not turn_left:
			rotation += rotation_speed * (velocity.length() / max_speed + rotation_speed_minimum) * delta

		# Adjust speed
		if move_up:
			velocity += Vector2(acceleration * delta, 0).rotated(rotation)
			velocity = velocity.limit_length(max_speed)  # Clamp to max speed
		elif move_down:
			velocity = velocity.move_toward(Vector2.ZERO, brake_deceleration * delta)
		else:
			velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)
	
	# Move and apply velocity
	move_and_slide()

# -------------------------------------------------------------------------------- #

# Take Damage
func take_damage(damage_power):
	if !is_dead:
		print("Player took damage: " + str(damage_power))
		
		health -= damage_power
		if health <= 0:
			health = 0
			die()
		else:
			hurt_sound.play()
		animate_health()

# -------------------------------------------------------------------------------- #

# Animate Health
func animate_health():
	print("Player health: " + str(health))
	animated_health_sprite.play(str(health))

# -------------------------------------------------------------------------------- #

# Player Die
func die():
	is_dead = true
	animated_player_sprite.stop()
	die_sound.play()
	print("You died")

# -------------------------------------------------------------------------------- #
