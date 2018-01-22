extends VBoxContainer

var current_scroll = 0
onready var scroller = get_parent()
onready var click_timer = get_node("ClickTimer")

export var d_speed = 1
var cur_speed = 0
var diff_speed = 0
var scrolling = false
var active = false
var last_played = null
var just_pressed = false

func _ready():
	set_process_input(true)
	pass

func _input(event):
	if !active: 
		return 0		
		
	if event is InputEventScreenDrag:
		just_pressed = true
		scrolling = true
		diff_speed = event.relative.y
		if(diff_speed < 0):
			diff_speed *= -1
		if event.relative.y > 0:
			cur_speed = (d_speed + diff_speed) * -1
		else:
			cur_speed = d_speed + diff_speed
		
		move_scroller(cur_speed)
		
		if !event.is_pressed() && just_pressed:
			click_timer.start()

func move_scroller(arg):
	scroller.set(
	"scroll_vertical", scroller.get("scroll_vertical")+arg)
	



func _on_ClickTimer_timeout():
	scrolling = false
	just_pressed = false
	print("Just released")
	pass
