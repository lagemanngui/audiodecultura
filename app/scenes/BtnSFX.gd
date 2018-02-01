extends TextureButton

signal finished_play
signal start_play

var sfx = ""

var audio_player
var playing = false

var is_favorite = false
var is_on = "main"

var mypath
var myep
var myname

var check_fav

func _ready():
	if(is_on == "main"):
		check_fav = get_parent().get_parent().get_parent().fav_dic
		get_favorites()
	else:
		get_node("AddFav").set("visible",false)
	pass

func update_fav():
	if(!is_favorite):
		get_node("AddFav").modulate = Color(0,0,0,1)
	else:
		get_node("AddFav").modulate = Color(1,1,1,1)	
	
func set_label_name(param):
	myname = param
	get_node("Titulo").set("text", param)
	pass

func set_play_sfx(param):
	mypath = param
	sfx = param
	var audio = load(param)
	audio_player = get_node("AudioPlayer")
	audio_player.set("stream", audio)
	pass

func set_label_ep(param):
	myep = param
	get_node("EP").set("text", "#" + param)

func stop_sfx():
	audio_player = get_node("AudioPlayer")
	audio_player.stop()
	emit_signal("finished_play")
	get_node("Titulo").modulate = Color("ffffff")	
	
	
func _on_AudioPlayer_finished():
	get_node("Titulo").modulate = Color("ffffff")	
	emit_signal("finished_play")
	playing = false
	pass


func _on_TextureButton_start_play():
	get_node("Titulo").modulate = Color("2dff20")
	playing = true
	pass

func get_favorites():
	if check_fav == null: 
		return 0
	
	if check_fav.favs.size() <= 0:
		return 0
		
	for item in check_fav.favs:
		if item.path == self.mypath:
			self.is_favorite = true
			update_fav()
	pass	

func set_fav_to():
	if(is_favorite):
		is_favorite = false
	else:
		is_favorite = true
	
	var to_remove = []	
	#Adiciona o favorito
	if is_favorite:
		var new = {"name":myname, "path":mypath, "ep":myep}
		check_fav.favs.push_front(new)
	#Remove dos favoritos
	else:			
		for i in check_fav.favs.size():
			if check_fav.favs[i].name == myname:
				to_remove.push_back(i)
	
	if(to_remove.size()>0):
		for i in to_remove.size():
			check_fav.favs.remove(to_remove[i])
	#Escreve no arquivo
	var n_f = File.new()
	n_f.open("user://favoritos.json", n_f.WRITE)
	n_f.store_string(to_json(check_fav))
	n_f.close()
	update_fav()
	pass # replace with function body
