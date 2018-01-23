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
	audio_player = get_node("AudioPlayer")
	audio_player.stop()
	emit_signal("finished_play")
	get_node("picon").modulate = Color("ffffff")	
	
	
func _on_AudioPlayer_finished():
	get_node("picon").modulate = Color("ffffff")	
	emit_signal("finished_play")
	playing = false
	pass


func _on_TextureButton_start_play():
	get_node("picon").modulate = Color("2dff20")
	playing = true
	pass
