extends VBoxContainer

func _ready():
	set_process_input(true)
	pass

func _input(event):
	if event is InputEventScreenDrag:
		print(event.speed.y)
