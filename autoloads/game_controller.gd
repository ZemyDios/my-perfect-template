extends Node


func _ready() -> void:
	OverlayRegistry.register("pause_menu", preload("res://scenes/ui/pause_menu.tscn"))


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		var pause_menu := OverlayRegistry.get_overlay("pause_menu")
		SceneManager.add_overlay(pause_menu)
