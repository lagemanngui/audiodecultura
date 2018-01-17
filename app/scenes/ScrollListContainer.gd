extends ScrollContainer

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
	get_node("VBoxContainer").add_child(btn_ins)

func clear_btns():
	for node in get_node("VBoxContainer").get_children():
		if node is TextureButton:
			node.queue_free()