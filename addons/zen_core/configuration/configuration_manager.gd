extends Node

const DEFAULT_PATH: String = "res://addons/zen_core/configuration/default_config.cfg"
const USER_PATH: String = "user://configuration.cfg"

var config: ConfigFile = ConfigFile.new()


func _ready() -> void:
	load_config()
	print(config.encode_to_text())


func load_config() -> void:
	if config.load(USER_PATH) != OK:
		print("[ZEN] No user config found, loading defaults.")
		config.load(DEFAULT_PATH)


func save_config() -> void:
	config.save(USER_PATH)


func get_value(section: String, key: String, default = null):
	return config.get_value(section, key, default)


func set_value(section: String, key: String, value):
	config.set_value(section, key, value)
	save_config()


func reset_to_defaults():
	config.load(DEFAULT_PATH)
	save_config()
