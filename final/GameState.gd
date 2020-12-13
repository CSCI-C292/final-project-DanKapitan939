extends Node

var score: int = 15

var is_game_over := false
var has_won := false

func remove_coin(amount: int) -> void:
	score -= amount
	if score == 0:
		has_won = true
func initiate_game_over():
	is_game_over = true
func initiate_victory():
	has_won = true
