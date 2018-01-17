extends Control


func _ready():
	pass
	
func _on_GenericButton_pressed():
	get_parent().emit_signal("clicked", get_parent().btn_name)
	pass
