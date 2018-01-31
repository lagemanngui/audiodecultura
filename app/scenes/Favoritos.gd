extends Control

onready var fav_list = get_node("FavList")

func _ready():
	
	pass

func load_favs(favs_dic):
	
	if favs_dic.favs.size() > 0:
		get_node("FavAviso").set("visible",false)
	else:
		get_node("FavAviso").set("visible",true)
	
	for item in favs_dic.favs:
		fav_list.create_btn(item.name, item.path, item.ep, "fav")
		
	get_node("FavList").activate()
	

func _on_Fechar_pressed():
	self.set("rect_position",Vector2(2000,2000))
	fav_list.clear_btns()	
	pass # replace with function body


func _on_BtnVoltar_pressed():
	self.set("rect_position",Vector2(2000,2000))
	fav_list.clear_btns()
	pass # replace with function body
