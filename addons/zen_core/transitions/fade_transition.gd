extends Transition


func play_in():
	$ColorRect.color.a = 0.0
	var tween := create_tween()
	tween.tween_property($ColorRect, "color:a", 1.0, 0.5)
	await tween.finished
	transition_in_finished.emit()


func play_out():
	$ColorRect.color.a = 1.0
	var tween := create_tween()
	tween.tween_property($ColorRect, "color:a", 0.0, 0.5)
	await tween.finished
	transition_out_finished.emit()
