extends Node

var body_text

func _ready():
	body_text = ""
	pass



func _on_close_pressed():
	get_parent().last_scene = "Main"
	self.set("rect_position", Vector2(2000,0))
	pass


func _on_git_pressed():
	OS.shell_open("https://github.com/lagemanngui/audiodecultura")
	pass
