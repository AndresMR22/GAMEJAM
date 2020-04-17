extends Area2D

#var Pos = position.x #Starting Position
#var PosLim = Pos+60 #Position limit
#var Up = true #Going up or down?
func _ready():
	pass
#	Pos = position.x
#	PosLim = Pos+60


func _process(delta):
	pass
	#position.x+=rand_range(30,300)
	#position.y+=rand_range(150,30)
	#position=Vector2(rand_range(300,30),rand_range(150,30))
	
#	if position.x == PosLim:
#		Up = false
#	if position.x == Pos:
#		Up = true#
#	if Up:
#		position.x += 1
#	else:
#		position.x -= 1

func _on_Timer_timeout():
	pass # Replace with function body.
	$animacion.play("ratonDer")


func _on_Enemigo_area_entered(area):
	pass # Replace with function body.
	if(area.name=="Cabeza"):
		queue_free()
		
#func get_random_number(MAX,MIN):#funcion que genera los numeros
#	#de manera aleatoria
#	randomize()
#	var num = randi()%MAX+MIN
#	return num
