extends Node

var ply: Player
var settings: Resource

func _ready():
	var _owner = get_parent()
	
	await owner.ready
	
	ply = _owner as Player
	settings = ply.settings
	
	assert(ply != null)

func change_state(name, msg):
	if not get_node(name):
		return
