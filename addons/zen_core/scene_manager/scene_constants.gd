extends Node

# Scene types
const TYPE_MAIN := "main"
const TYPE_HUD := "hud"
const TYPE_POPUP := "popup"
const TYPE_OVERLAY := "overlay"

# Disposal policies
const POLICY_QUEUE_FREE := "queue_free"
const POLICY_HIDE := "hide"
const POLICY_REMOVE_CHILD := "remove_child"
const POLICY_PERSISTENT := "persistent"


# All values as arrays (for UI menus)
static func get_all_types() -> Array:
	return [TYPE_MAIN, TYPE_HUD, TYPE_POPUP, TYPE_OVERLAY]


static func get_all_policies() -> Array:
	return [POLICY_QUEUE_FREE, POLICY_HIDE, POLICY_REMOVE_CHILD, POLICY_PERSISTENT]
