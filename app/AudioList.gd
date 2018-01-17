extends Node

var rogerinho_list
var renan_list
var maurilio_list
var julinho_list

func _ready():
	
	load_rogerinho()
	
	pass

func load_rogerinho():
	rogerinho_list = [
	{"name":"Achou errado", "path":"errado.ogg", "ep":"12"},
	{"name":"Aqui tem informação", "path":"informacao.ogg", "ep":"14"}
	]

func load_renan():
	renan_list = [
	{"name":"Achou errado", "path":"errado.ogg", "ep":"12"},
	{"name":"Aqui tem informação", "path":"informacao.ogg", "ep":"14"}
	]
	pass
func load_maurilio():
	maurilio_list = [
	{"name":"Achou errado", "path":"errado.ogg", "ep":"12"},
	{"name":"Aqui tem informação", "path":"informacao.ogg", "ep":"14"}
	]
	pass

func load_julinho():
	julinho_list = [
	{"name":"Achou errado", "path":"errado.ogg", "ep":"12"},
	{"name":"Aqui tem informação", "path":"informacao.ogg", "ep":"14"}
	]
	pass

func get_rogerinho():
	return rogerinho_list

func get_renan():
	return renan_list

func get_maurilio():
	return maurilio_list

func get_julinho():
	return julinho_list