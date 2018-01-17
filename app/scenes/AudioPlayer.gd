extends AudioStreamPlayer


func _ready():
	pass


func play_sfx():
	if get_parent().get_parent().get_parent().fins == false:
		get_parent().get_parent().get_parent().fins = true
		get_parent().get_parent().get_parent().last_play.stop_sfx()
		
	get_parent().emit_signal("start_play")
	self.play(0)
	pass


