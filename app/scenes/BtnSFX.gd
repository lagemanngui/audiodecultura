extends TextureButton

var sfx = ""

var audio_player

func _ready():
	pass

func set_label_name(param):
	get_node("Titulo").set("text", param)
	pass

func set_play_sfx(param):
	sfx = param
	var audio = load(param)
	audio_player = get_node("AudioPlayer")
	audio_player.set("stream", audio)
	pass

func set_label_ep(param):
	get_node("EP").set("text", "#" + param)

