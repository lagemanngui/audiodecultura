extends Node

var rog_path = "res://rogerinho/sfx/"
var rogerinho_list

var ren_path = "res://renan/sfx/"
var renan_list

var mau_path = "res://maurilio/sfx/"
var maurilio_list

var jul_path = "res://julinho/sfx/"
var julinho_list

func _ready():
	
	load_rogerinho()
	load_renan()
	load_maurilio()
	load_julinho()
	
	pass

func load_rogerinho():
	rogerinho_list = [
	{"name":"Encontrou, porra!", "path":"rog_encontrou_porra.ogg", "ep":"01"},
	{"name":"Circo do Marcos Frota", "path":"rog_circo_do_marcos.ogg", "ep": "01"}
	]
	
	complete_path(rogerinho_list, rog_path)

func load_renan():
	renan_list = [
	{"name":"Não tem Harry Potter", "path":"me_agredir_no_cinema.ogg", "ep": "01"}
	]
	
	complete_path(renan_list, ren_path)
	
	pass
func load_maurilio():
	maurilio_list = [
	{"name":"Achou errado", "path":"errado.ogg", "ep":"12"},
	{"name":"Aqui tem informação", "path":"informacao.ogg", "ep":"14"}
	]
	
	complete_path(maurilio_list, mau_path)
	
	pass

func load_julinho():
	julinho_list = [
	{"name":"Achou errado", "path":"errado.ogg", "ep":"12"},
	{"name":"Aqui tem informação", "path":"informacao.ogg", "ep":"14"}
	]
	
	complete_path(julinho_list, jul_path)
	
	pass

func complete_path(arr, path_name):
	for item in arr:
		item.path = path_name + item.path
	
func get_rogerinho():
	return rogerinho_list

func get_renan():
	return renan_list

func get_maurilio():
	return maurilio_list

func get_julinho():
	return julinho_list