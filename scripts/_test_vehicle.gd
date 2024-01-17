extends RigidBody3D

# Initialize variables for vehicle controls
var acceleration = 0.0
var braking = 0.0

# Speed variables
var max_acceleration = 50.0
var max_braking = 5.0
var max_steering = 1.5

# Called when the node enters the scene tree for the first time.
func _ready():
	# Initialization code here
	set_up_vehicle()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_input(delta)
	#apply_vehicle_controls()

# Setup the vehicle parameters
func set_up_vehicle():
	# Set up the vehicle's wheels, engine, and other parameters here
	pass

# Handle user input
func handle_input(delta):
	# Adjust acceleration, braking, and steering based on user input
	var engine_force = Input.get_action_strength("accelerate")
	var brake = Input.get_action_strength("break")
	var steering = (Input.get_action_strength("stear_right") - Input.get_action_strength("stear_left"))
	
	print(engine_force)

# Optional: Implement a method to handle collisions
func _on_body_entered(body):
	# This method is called when the vehicle collides with another body
	print("Collision detected with: ", body.name)
