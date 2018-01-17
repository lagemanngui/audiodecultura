extends TextureButton

signal finished_play
signal start_play

var sfx = ""

var audio_player
var playing = false

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

func stop_sfx():
	print("Stop?")
	audio_player = get_node("AudioPlayer")
	audio_player.stop()
	
func _on_AudioPlayer_finished():
	emit_signal("finished_play")
	playing = false
	pass
