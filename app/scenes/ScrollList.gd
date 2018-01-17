extends VBoxContainer

var current_scroll = 0
onready var scroller = get_parent()
export var d_speed = 8
var cur_speed = 0
var diff_speed = 0
var scrolling = false
onready var timer = get_node("Timer")
var active = false

func _ready():
	set_process_input(true)
	pass

func _input(event):
	if !active: 
		return 0
		
	if event is InputEventScreenDrag:
		scrolling = true
		diff_speed = event.relative.y
		if(diff_speed < 0):
			diff_speed *= -1
		if event.relative.y > 0:
			cur_speed = (d_speed + diff_speed) * -1
		else:
			cur_speed = d_speed + diff_speed
			scroller.set(
			"scroll_vertical", scroller.get("scroll_vertical")+cur_speed
			)
		timer.start()
		



func list_btn_pressed(arg):
	if !scrolling:
		print("Playing: " + arg.sfx)
	pass


func _on_Timer_timeout():
	scrolling = false
	print("Timer stopped")
	pass

