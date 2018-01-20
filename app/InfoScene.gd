extends Node

var body_text

func _ready():
	body_text = ""
	pass



func _on_close_pressed():
	self.set("rect_position", Vector2(1000,0))
	pass


func _on_git_pressed():
	OS.shell_open("https://github.com/lagemanngui/audiodecultura")
	pass
