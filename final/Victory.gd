extends Label


func _process(delta):
	if GameState.has_won:
		self.visible = true
