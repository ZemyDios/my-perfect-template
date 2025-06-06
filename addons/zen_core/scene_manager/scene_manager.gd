extends Node

const MAIN_SCENE = preload("res://main.tscn")

@onready var scene_handler: SceneHandler


func _ready() -> void:
	print("[ZEN] - " + str(self.name) + " loaded.")
	scene_handler = get_tree().current_scene

	scene_handler.add_scene_to_ui(MAIN_SCENE.instantiate())
