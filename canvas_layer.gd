extends CanvasLayer

@onready var textbox_container = $Textboxalicious
@onready var start_symbol = $Textboxalicious/Panel/MarginContainer/Startt
@onready var end_symbol = $Textboxalicious/Panel/MarginContainer/End
@onready var label = $Textboxalicious/Panel/MarginContainer/Panel/Label

func _ready():
	hide_textbox()
	add_text("you're playing period poverty!")

func hide_textbox():
	start_symbol.text = ""
	end_symbol.text = ""
	label.text = ""
	textbox_container.hide()
	
func start_textbox():
	start_symbol.text = "*"
	textbox_container.show()

func add_text(next_text):
	label.text = next_text
	start_textbox()
	
