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
	{"name":"Circo do Marcos Frota", "path":"rog_circo_do_marcos.ogg", "ep": "01"},
	{"name":"Cultura jovem", "path":"cultura_jovem.ogg", "ep": "02"},
	{"name":"Harry Potter é droga", "path":"eh_droga.ogg", "ep": "02"},
	{"name":"É maconha", "path":"eh_maconha.ogg", "ep": "02"},	
	{"name":"Não é um Transformers...", "path":"nao_e_transformers.ogg", "ep": "02"}			
	]
	
	complete_path(rogerinho_list, rog_path)

func load_renan():
	renan_list = [
	{"name":"Não tem Harry Potter", "path":"me_agredir_no_cinema.ogg", "ep": "01"},
	{"name":"Adulto esquisito", "path":"adulto_esquisito.ogg", "ep": "01"},
	{"name":"Excelente filme!", "path":"excelente_filme.ogg", "ep": "01"},
	{"name":"Água na cara eu sou contra", "path":"contra_agua_nacara.ogg", "ep": "01"},
	{"name":"Fazer curso pra ver o filme", "path":"tem_que_fazer_curso.ogg", "ep": "01"},
	{"name":"Ele tem talento pra isso, Rogerinho", "path":"talento_pra_isso.ogg", "ep": "01"},
	{"name":"Tem que ter Rambo", "path":"tem_rambo.ogg", "ep": "01"},
	{"name":"Filme nacional tem livro?", "path":"filme_nacional_tem_livro.ogg", "ep": "01"},
	{"name":"Só magia TOP", "path":"so_magia_top.ogg", "ep": "02"},
	{"name":"Que que é edição de som?", "path":"edicao_de_som.ogg", "ep": "02"},
	{"name":"Ele tem talento pra isso!", "path":"talento_2.ogg", "ep": "02"},
	{"name":"A topeira voar é normal?", "path":"topera_voar.ogg", "ep": "02"},
	{"name":"Urso é cultura jovem", "path":"urso_cultura_jovem.ogg", "ep": "02"}	
	]
	
	complete_path(renan_list, ren_path)
	
	pass
func load_maurilio():
	maurilio_list = [
	{"name":"Boa noite, amantes de cinema", "path":"amantes_de_cinema.ogg", "ep":"01"},
	{"name":"Harry Golpe", "path":"harry_golpe.ogg", "ep":"01"},
	{"name":"Spin Off", "path":"spin_off.ogg", "ep":"01"},
	{"name":"Livro do Rambo", "path":"livro_do_rambo.ogg", "ep":"01"},
	{"name":"Muita criança na sala", "path":"muita_crianca.ogg", "ep":"02"},
	{"name":"O som fica sem edição", "path":"sem_edicao.ogg", "ep":"02"}
	
	]
	
	complete_path(maurilio_list, mau_path)
	
	pass

func load_julinho():
	julinho_list = [
	{"name":"Boa noite, pilotos", "path":"boa_noite_pilotos.ogg", "ep":"01"},
	{"name":"Não tem Conrado", "path":"nao_tem_conrado.ogg", "ep":"01"},
	{"name":"Se Eu Fosse Você 2", "path":"fosse_voce_2.ogg", "ep":"01"},
	{"name":"Me permite um protesto", "path":"protesto.ogg", "ep":"01"},
	{"name":"Como tu chega em mulher?", "path":"como_tu_chega_em_mulher.ogg", "ep":"01"},
	{"name":"Me da aquela moralzinha", "path":"me_da_moralzinha.ogg", "ep":"01"},
	{"name":"Essa porra é um pato", "path":"e_um_pato.ogg", "ep":"02"},
	{"name":"Tudo computador saporra", "path":"tudo_computador.ogg", "ep":"02"},
	{"name":"Muito diálogo", "path":"muito_dialogo.ogg", "ep":"02"}
	
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