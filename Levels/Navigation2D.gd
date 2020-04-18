extends Navigation2D

var speed =30 #rapidez del enemigo
var path = [] # la ruta del enemigo array
var player 
var enemy 

func _ready():
	pass
	
func movimiento_jugador(pos_inicial, pos_final):
	path = self.get_simple_path(pos_inicial,pos_final)
	print(get_simple_path(pos_inicial,pos_final))
	path.remove(0)
	
func _process(delta):
	pass
	 #get_tree().get_root().get_node("scene_main_node/node_wanted")
	player = get_parent().get_parent().get_node("Culebra").get_node("Cabeza")
	enemy = get_parent()
	#print("get parent get pa ", get_parent().get_parent().get_node("Culebra").get_node("Cabeza"))
	
	movimiento_jugador(enemy.position, player.position)
	
	var distancia = speed*delta
	_seguir_ruta(distancia)

func _seguir_ruta(distancia):
	pass
	var ultima_pos = enemy.position
	for i in range(path.size()):
		var distancia_al_final = ultima_pos.distance_to(path[0])
		if (distancia<=distancia_al_final):
			enemy.position=ultima_pos.linear_interpolate(path[0],distancia/distancia_al_final)
			break #fin for
		elif distancia <= 0.0 :
			enemy.position = path[0]
			break
		distancia -= distancia_al_final
		ultima_pos= path[0]
		path.remove(0)
		
		
		
		
		
		
		
		
		
		
		
		
		
	

