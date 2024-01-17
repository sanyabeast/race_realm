extends Node3D

class_name Pawn

func _physics_process(delta):
	update_systems(delta)
	update_movement(delta)

func update_local_player(delta):
	pass
	
func update_remote_player(delta):
	pass
	
func update_npc_player(delta):
	pass
	
func update_movement(delta):
	pass	

func update_systems(delta):
	pass
