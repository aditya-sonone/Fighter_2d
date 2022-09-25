extends RigidBody2D

var explosion = preload("res://explosion.tscn")

func _on_Chidori_body_entered(body):
	if !body.is_in_group("player") or body.is_in_group("enemy"):
		var explosion_instance = explosion.instance()
		explosion_instance.position = get_global_position()
		get_tree().get_root().add_child(explosion_instance)
		queue_free()
