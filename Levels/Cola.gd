extends Area2D

var direcciones = [] #direcciones de los hijos en el vector
var pos_array = [] #posicion de cada hijo en el vector
var cur_dir = Vector2()


func _process(delta):
	if(direcciones.size()>0):
		if(position == pos_array[0]):
			cur_dir=direcciones[0]
			remove_from_cola()
	position += cur_dir

func remove_from_cola():
	direcciones.pop_front()
	pos_array.pop_front()
	
func add_to_cola(cabeza_pos,dir):
	pos_array.append(cabeza_pos)
	direcciones.append(dir)
	


func _on_Cola_area_entered(area):
	pass
	#if(area.name == "Cabeza"):
	#	get_tree().reload_current_scene()
