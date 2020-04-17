extends Node2D

onready var fruta = preload("res://Levels/Alimento.tscn")

func _ready():
	add_fruta()

func add_fruta():
	var inst = fruta.instance()#se guarda la instancia de
	#la fruta en inst
	
	inst.position = Vector2(get_random_number(300,30),get_random_number(150,30))
	inst.connect("fruta_comida",self,"spawn_next_fruta_and_cola")
	add_child(inst)
	# se genera una posicion aleatoria del origen del fruto
	# y se añade como hijo de escena mundo
	
func spawn_next_fruta_and_cola():
	add_fruta()#se repite la funcion de arriba
	$Culebra.add_cola()#se llama a la funcion del nodo 
	
func get_random_number(MAX,MIN):#funcion que genera los numeros
	#de manera aleatoria
	randomize()
	var num = randi()%MAX+MIN
	return num
