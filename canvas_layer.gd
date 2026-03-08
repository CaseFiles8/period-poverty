extends CanvasLayer

signal dialogue_finished

enum State {
	READY,
	READING,
	FINISHED
}

const CHAR_RATE = 0.075

@onready var label = $Textboxalicious/Panel/MarginContainer/Panel/Label
@onready var bg = $Textboxalicious/Panel   # panel holding the texture

var tween: Tween
var state: State

func _ready():
	_hide()
	state = State.READY
	
	randomize()
	_hide()
	state = State.READY


func _process(_delta):

	if Input.is_action_just_pressed("ui_select"):

		match state:

			State.READY:
				_display_dialogue("welcome to period poverty!")

			State.READING:
				_finish()

			State.FINISHED:
				_hide()
				state = State.READY

				# second popup happens here
				show_pad_result()


func _hide():
	label.text = ""
	label.visible_ratio = 0
	bg.visible = false


func _show():
	bg.visible = true
	tween = create_tween()
	tween.finished.connect(_finish)


func _finish():
	if tween:
		tween.kill()

	label.visible_ratio = 1
	state = State.FINISHED


func _display_dialogue(lines):

	label.text = lines
	label.visible_ratio = 0

	_show()

	tween.tween_property(label, "visible_ratio", 1.0, len(lines) * CHAR_RATE)

	state = State.READING
	
func show_pad_result():

	var chance = randf()

	if chance <= 0.3:
		_display_dialogue("you found a pad!")
	else:
		_display_dialogue("there are no pads in this restroom :(")
		
