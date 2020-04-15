extends Node2D #CABEZA

var direccion = Vector2(1,0)
const gap = -35
var next_cola_dir = Vector2(1,0)
var prev_dir = Vector2(1,0)

onready var cola = preload("res://Levels/Cola.tscn")

func _ready():
	
	add_cola()
	add_cola()

	
func _process(delta):
	pass
	if(Input.is_action_just_pressed("ui_up")):
		pass
		direccion=Vector2(0,-1)
	elif(Input.is_action_just_pressed("ui_down")):
		direccion=Vector2(0,1)
	elif(Input.is_action_just_pressed("ui_left")):
		direccion=Vector2(-1,0)
	elif(Input.is_action_just_pressed("ui_right")):
		direccion=Vector2(1,0)
	mover_culebra()

func mover_culebra():  
	var dir_cambio = false
	if(prev_dir != direccion):#if el vector prev no tiene la misma direccion que dir
		prev_dir = direccion   # entonces que tome ese direccion de dir
		dir_cambio = true		#que el cambio de direccion sea afirmativo
	var cabeza_pos = $Cabeza.position
	$Cabeza.position+=direccion# se actualiza la posicion de la cabeza 
	
	if ( dir_cambio): # si es afirmativo el cambio de direccion entonces
		for i in range(1,get_child_count()): # se mueve de 1 a la n cantidad de hijos existentes
			get_child(i).add_to_cola(cabeza_pos,direccion)
			#y a cada hijo le pasa los datos de posicion de la cabeza y direccion

func add_cola():
	var inst=cola.instance()#se guarda la inst de la cola
	var prev_cola = get_child(get_child_count()-1)
	#prev_cola guardara el ultimo hijo de la cabeza
	if (prev_cola.name != "Cabeza"):
		#if el ultimo hijo. no es Cabeza
		inst.cur_dir = prev_cola.cur_dir
		#la new cola ira en la misma direccion de la cola
		#anterior
		for i in range (0 , prev_cola.pos_array.size()):
			inst.pos_array.append(prev_cola.pos_array[i])
			inst.direcciones.append(prev_cola.direcciones[i])
		inst.position = prev_cola.position+prev_cola.cur_dir*gap
	else:
		inst.cur_dir = direccion
		inst.position = prev_cola.position + direccion*gap
	add_child(inst)


func _on_Cabeza_area_entered(area):
	pass # Replace with function body.
	if(area.name=="Alimento"):
		$Cabeza/Sprite.visible = false
		$Cabeza/Sprite2.visible=true
	else:
		$Cabeza/Sprite.visible = true
		$Cabeza/Sprite2.visible=false
