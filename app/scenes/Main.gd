extends Node

onready var tween = get_node("AnimControl")
onready var back = get_node("Voltar")
onready var sfxlist = get_node("SfxList")
onready var audio_list = get_node("AudioList")


export var def_anim_speed = 0.3
export var variant = 0.1
var buttons = 6
var cur_btns = 0
var anim_speed = 0
var can_click = true
var btn_pressed
var anim_op = 0

var rog_path = "res://rogerinho/sfx/"
var rogerinho_sfx = []

var ren_path = "res://renan/sfx/"
var renan_sfx = []

var mau_path = "res://maurilio/sfx/"
var maurilio_sfx = []

var jul_path = "res://julinho/sfx/"
var julinho_sfx = []



func _ready():
	anim_speed = def_anim_speed
	
	#Carrega os audios
	rogerinho_sfx = audio_list.get_rogerinho()
	renan_sfx = audio_list.get_renan()
	maurilio_sfx = audio_list.get_maurilio()
	julinho_sfx = audio_list.get_julinho()
	
	pass


#Função que chama o menu de audios baseado
#no 'param' do botão pressionado
func on_btn_clicked(param):
	if can_click == false:
		print("Click is false")
		return 0
	can_click = false
	btn_pressed = get_node(param)
	print("Selecionado: " + param)
	
	if param == "Voltar":
		show_menu_btns()
	else:
		hide_menu_btns()
	
	pass
func change_opct(toggle):
	if btn_pressed.btn_name == "Voltar": return 0
	btn_pressed.modulate = Color(1,1,1, toggle)
		
	
func hide_menu_btns():
	anim_op = 1
	sfxlist.activate()
	for btn in get_tree().get_nodes_in_group("buttons"):
		tween.interpolate_property(btn, "rect_position", 
		Vector2(
		btn.get("rect_position").x, btn.get("rect_position").y
		), 
		Vector2(
		btn.get("rect_position").x-720, btn.get("rect_position").y
		), 
		anim_speed, tween.TRANS_QUAD, tween.EASE_OUT)
		#delay na animação
		anim_speed += variant
	tween.start()
	anim_speed = def_anim_speed
	
	
	for i in range(0, rogerinho_sfx.size()):
		sfxlist.create_btn(rogerinho_sfx[i].name, 
		rogerinho_sfx[i].path, rogerinho_sfx[i].ep)

func show_menu_btns():
	anim_op = 0
	sfxlist.deactivate()
	for btn in get_tree().get_nodes_in_group("buttons"):
		tween.interpolate_property(btn, "rect_position", 
		Vector2(
		btn.get("rect_position").x, btn.get("rect_position").y
		), 
		Vector2(
		btn.get("rect_position").x+720, btn.get("rect_position").y
		), 
		anim_speed, tween.TRANS_QUAD, tween.EASE_OUT)
		#delay na animação
		anim_speed += variant
	tween.start()
	anim_speed = def_anim_speed

func on_anim_completed( object, key ):
	cur_btns+=1
	if(cur_btns == buttons):
		can_click = true
		cur_btns = 0
		if anim_op == 0:
			sfxlist.clear_btns()
			
		
