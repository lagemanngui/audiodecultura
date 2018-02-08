extends Node

#Nodes da Scene
onready var tween = get_node("AnimControl")
onready var back = get_node("Voltar")
onready var sfxlist = get_node("SfxList")
onready var audio_list = get_node("AudioList")
onready var info_scene = get_node("InfoScene")
onready var second_bg = get_node("SecondBG")
onready var current_audio = get_node("CurrentAudio")
onready var fav_scene = get_node("Favoritos")

#Constantes
const ROGERINHO = "Rogerinho"
const RENAN = "Renan"
const MAURILIO = "Maurilio"
const JULINHO = "Julinho"
const VOLTAR = "Voltar"
const ANIM_HIDE = 1
const ANIM_SHOW = 0
const LAST_MAIN = "Main"
const LAST_INFO = "Info"
const LAST_SFX = "Sfx"
const LAST_FAV = "Fav"

const FAV_PATH = "user://favoritos.json"



#Velocidade da animação das janelas
export var def_anim_speed = 0.3
#Variação na velocidade de animação (Remover depois)
export var variant = 0.0
#Quantidade de itens 'botoes' para animar
var buttons = 10
#Botoes animados ate o momento, segura o comando do app
#quando chega a 'buttons' libera o comando para o usuário
var cur_btns = 0
#Velocidade da animação dos botões
var anim_speed = 0
#Auxiliar para comando do app
var can_click = true
#Qual opção foi selecionada no menu principal
var btn_pressed
#Qual operação esta sendo feito
var anim_op = 0
#Nome do botão selecionado
var param_selected
#Guarda pra onde deve voltar
var last_scene = ""
#Se esta exibindo a tela de info
var info_active = false

var rogerinho_sfx = []
var renan_sfx = []
var maurilio_sfx = []
var julinho_sfx = []

var fav_file
var fav_txt
var fav_dic = {}

func _ready():
	
	
	#Verifica se o arquivo de FAVORITOS existe
	fav_file = File.new()
	if fav_file.file_exists(FAV_PATH):
		print("Arquivo existe, vamos abrir")
		fav_file.open(FAV_PATH, fav_file.READ)
	else:
		print("Nao tem texto nenhum - criando arquivo")
		fav_txt = "{\"favs\":[]}"
		fav_file.open(FAV_PATH, fav_file.WRITE)
		fav_file.store_string(fav_txt)
		fav_file.close()
		fav_file.open(FAV_PATH, fav_file.READ)
	
	fav_txt = fav_file.get_as_text()
	fav_dic = parse_json(fav_txt)
	fav_file.close()
	
	
	
	print(str(fav_dic))
	
	
	last_scene = LAST_MAIN
	#Set a velocidade de animação
	anim_speed = def_anim_speed
	
	#Carrega os audios
	rogerinho_sfx = audio_list.get_rogerinho()
	renan_sfx = audio_list.get_renan()
	maurilio_sfx = audio_list.get_maurilio()
	julinho_sfx = audio_list.get_julinho()
	
	pass

#Controla o botao de voltar do android
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		if last_scene == LAST_MAIN:
			get_tree().quit()
		elif last_scene == LAST_INFO:
			hide_info()
		elif last_scene == LAST_SFX:
			show_menu_btns()
		elif last_scene == LAST_FAV:
			hide_favs()
			
			

#Função que chama o menu de audios baseado
#no 'param' do botão pressionado
func on_btn_clicked(param):
	
	#Checa e pode selecionar um botao
	#caso negativo retorna
	if can_click == false:
		print("Não pode selecionar ainda")
		return 0
	
	
	can_click = false
	btn_pressed = get_node(param)
	print("Selecionado: " + param)
	param_selected = param
	
	#Escolhe a operação baseado em qual botão
	#foi selecionado pelo usuário
	if param == VOLTAR:
		show_menu_btns()
	else:
		hide_menu_btns()	
	pass


#Função que mostra a lista de audio selecionada pelo user
func hide_menu_btns():
	last_scene = LAST_SFX
	#Set o tipo de ação para hide
	anim_op = ANIM_HIDE
	#Ativa a lista de audio
	sfxlist.activate()
	
	#Exibe o bg
	second_bg.set("position", Vector2(0,0))
	
	#Anima os botões com Tween
	for btn in get_tree().get_nodes_in_group("buttons"):
		tween.interpolate_property(btn, "rect_position", 
		Vector2(
		btn.get("rect_position").x, btn.get("rect_position").y
		), 
		Vector2(
		btn.get("rect_position").x-720, btn.get("rect_position").y
		), 
		anim_speed, tween.TRANS_QUAD, tween.EASE_OUT)
	tween.start()
	
	#Chama a lista especificada
	match param_selected:
		ROGERINHO : load_rogerinho_sfx_btns()
		RENAN: load_renan_sfx_btns()
		MAURILIO: load_maurilio_sfx_btns()
		JULINHO: load_julinho_sfx_btns()
	

#Funções para carregar os botões de sons
#na lista de audio selecionada
func load_rogerinho_sfx_btns():
	var n_texture = load("res://rogerinho/img/rogbtn.jpg")
	current_audio.texture_normal = n_texture
	
	for i in range(0, rogerinho_sfx.size()):
		sfxlist.create_btn(rogerinho_sfx[i].name, 
		rogerinho_sfx[i].path, rogerinho_sfx[i].ep)

func load_renan_sfx_btns():
	var n_texture = load("res://renan/img/renbtn.jpg")
	current_audio.texture_normal = n_texture
	
	for i in range(0, renan_sfx.size()):
		sfxlist.create_btn(renan_sfx[i].name, 
		renan_sfx[i].path, renan_sfx[i].ep)

func load_maurilio_sfx_btns():
	var n_texture = load("res://maurilio/img/maubtn.jpg")
	current_audio.texture_normal = n_texture
	
	for i in range(0, maurilio_sfx.size()):
		sfxlist.create_btn(maurilio_sfx[i].name, 
		maurilio_sfx[i].path, maurilio_sfx[i].ep)

func load_julinho_sfx_btns():
	var n_texture = load("res://julinho/img/julbtn.jpg")
	current_audio.texture_normal = n_texture
	
	for i in range(0, julinho_sfx.size()):
		sfxlist.create_btn(julinho_sfx[i].name, 
		julinho_sfx[i].path, julinho_sfx[i].ep)


#Função que fecha a lista de audio e exibe 
#novamente o menu principal
func show_menu_btns():
	last_scene = LAST_MAIN
	#Define o tipo de ação para show
	anim_op = ANIM_SHOW
	#Desativa a lista de audio (aka deleta os botoes)
	sfxlist.deactivate()
	
	#hide bg	
	second_bg.set("position", Vector2(2000,0))
	
	
	#Animação dos botões
	for btn in get_tree().get_nodes_in_group("buttons"):
		tween.interpolate_property(btn, "rect_position", 
		Vector2(
		btn.get("rect_position").x, btn.get("rect_position").y
		), 
		Vector2(
		btn.get("rect_position").x+720, btn.get("rect_position").y
		), 
		anim_speed, tween.TRANS_QUAD, tween.EASE_OUT)
	tween.start()

#Callback da animação dos botões
func on_anim_completed( object, key ):
	#Pra cada botão soma 1, qdo chega a 'buttons'
	#libera o controle para o usuario novamente
	cur_btns+=1
	if(cur_btns == buttons):
		can_click = true
		cur_btns = 0
		
		if anim_op == ANIM_SHOW:
			sfxlist.clear_btns()
			

func show_info():
	last_scene  = LAST_INFO
	sfxlist.stop_all()
	info_scene.set("rect_position", Vector2(0,0))

func hide_info():
	last_scene = LAST_MAIN
	info_scene.set("rect_position", Vector2(2000,0))
	
func _on_Youtube_pressed():
	OS.shell_open("https://www.youtube.com/channel/UCaSAM5kna2KyX-uVLSGr8PQ")


func _on_Twitter_pressed():
	OS.shell_open("https://twitter.com/TVQuase")
	pass


func _on_Facebook_pressed():
	OS.shell_open("https://www.facebook.com/tvQuase/")
	pass

func hide_favs():
	last_scene = LAST_MAIN
	fav_scene._on_Fechar_pressed()
	
func _on_FavBtn_pressed():
	fav_scene.set("rect_position", Vector2(0,0))
	fav_scene.load_favs(fav_dic)
	pass


func _on_Downloads_pressed():
	var dir = Directory.new()	
	OS.shell_open("C:/Users/Guilherme/AppData/Roaming/Godot/app_userdata/Audio de Cultura")
	pass
