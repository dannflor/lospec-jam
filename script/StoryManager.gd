extends Node
class_name StoryManager

@onready var _ink_player = $InkPlayer


func _ready():
	_ink_player.loaded.connect(_story_loaded)
	_ink_player.continued.connect(_continued)
	_ink_player.prompt_choices.connect(_prompt_choices)
	_ink_player.ended.connect(_ended)

	_ink_player.create_story()


func _story_loaded(successfully: bool):
	if !successfully:
		return

	_ink_player.continue_story()


func _continued(text, _tags):
	print(text)
	_ink_player.continue_story()


func _prompt_choices(choices):
	if !choices.is_empty():
		print(choices)

		# In a real-world scenario, _select_choice' could be
		# connected to a signal, like 'Button.pressed'.
		_select_choice(0)


func _ended():
	print("The End")


func _select_choice(index):
	_ink_player.choose_choice_index(index)
	_ink_player.continue_story()
