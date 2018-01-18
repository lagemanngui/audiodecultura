extends Node

var body_text

func _ready():
	body_text = ""
	pass



func _on_close_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")
	pass
