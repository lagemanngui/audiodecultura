extends ScrollContainer

var fins = true
var last_play
func _ready():
	pass

func activate():
	get_node("VBoxContainer").active = true

func deactivate():
	get_node("VBoxContainer").active = false

func create_btn(titulo, play, ep):
	var btn = load("res://scenes/BtnSFX.tscn")
	var btn_ins = btn.instance()
	btn_ins.set_name("new_btn")
	btn_ins.set_label_name(titulo)
	btn_ins.set_play_sfx(play)
	btn_ins.set_label_ep(ep)
	btn_ins.connect("pressed", get_node("VBoxContainer"), "list_btn_pressed", [btn_ins])
	btn_ins.connect("finished_play", self, "on_btn_finished")
	btn_ins.connect("start_play", self, "on_btn_start", [btn_ins])
	get_node("VBoxContainer").add_child(btn_ins)

func on_btn_finished():
	fins = true
	print("Terminou de tocar")

func on_btn_start(arg):
	print("Começou a tocar")
	last_play = arg
	fins = false
	
func clear_btns():
	fins = true
	last_play = null
	
	for node in get_node("VBoxContainer").get_children():
		if node is TextureButton:
			node.queue_free()