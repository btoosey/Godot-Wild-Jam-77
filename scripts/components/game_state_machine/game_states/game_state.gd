class_name GameState
extends Node

signal transition_requested(from: GameState, to: State)

enum State {START, BUILD, ROLL, RACE}

@export var state: State


func enter() -> void:
	pass


func exit() -> void:
	pass
