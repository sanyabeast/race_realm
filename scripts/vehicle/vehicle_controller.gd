extends Pawn

class_name VehicleController

@export var center_of_mass_node: Node3D
@export var props: RVehicleProps

@onready var camera_system: Node3D = $CameraSystem
@onready var camera: Camera3D = $CameraSystem/Camera3D
@onready var vehicle_body: VehicleBody3D = $Vehicle

var steering: float = 0
var engine_force: float = 0 
var brake: float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	vehicle_body.center_of_mass = center_of_mass_node.position
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass # Replace with function body.

func _physics_process(delta):
	super._physics_process(delta)
	update_local_player(delta)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_systems(delta):
	camera_system.global_position = vehicle_body.global_position
	camera_system.global_rotation.y = lerp_angle(camera_system.global_rotation.y, vehicle_body.global_rotation.y, 0.1)

func update_local_player(delta):
	steering = Input.get_axis("vehicle_stear_right", "vehicle_stear_left") * props.max_steer
	engine_force = Input.get_axis("vehicle_engine_down", "vehicle_engine_up") * props.engine_power
	brake = (1 if Input.is_action_pressed("vehicle_hand_break") else 0) * props.brake_power

func update_movement(delta):
	print('movement')
	vehicle_body.steering = move_toward(vehicle_body.steering, steering, delta * 2.5)
	vehicle_body.engine_force = engine_force
	vehicle_body.brake = brake
