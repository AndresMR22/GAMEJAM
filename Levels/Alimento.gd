extends Area2D

signal fruta_comida

func _ready():
	pass


func _on_Alimento_area_entered(area):
	pass # Replace with function body.
	if(area.name == "Cabeza"):
		queue_free()
		emit_signal("fruta_comida")
