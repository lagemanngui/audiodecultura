extends TextureButton

var sfx = ""

onready var audio_player = get_node("AudioPlayer")

func _ready():
	pass

func set_label_name(param):
	get_node("Titulo").set("text", param)
	pass

func set_play_sfx(param):
	sfx = param
	#audio_player.set("stream", sfx)
	pass

func set_label_ep(param):
	get_node("EP").set("text", "#" + param)

