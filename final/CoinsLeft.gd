extends Label


func _process(delta):
	self.text = "Coins Left: " + str(GameState.score)
