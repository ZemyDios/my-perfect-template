class_name Transition extends CanvasLayer

signal transition_in_finished
signal transition_out_finished


# Methods that should be implemented
func play_in():
	push_warning("Transition: play_in() not implemented")
	transition_in_finished.emit()


func play_out():
	push_warning("Transition: play_out() not implemented")
	transition_out_finished.emit()
