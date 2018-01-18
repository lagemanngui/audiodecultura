extends AudioStreamPlayer

var parent_list

func _ready():
	pass


func play_sfx():
	
	parent_list = get_parent().get_parent().get_parent()
	if parent_list.last_play != null:
		if parent_list.last_play.get_name() == get_parent().get_name():
			if self.playing:
				get_parent().stop_sfx()
				return 0
			
	parent_list.stop_all()	
	get_parent().emit_signal("start_play")
	self.play(0)
	
	
	
		
	
	pass


