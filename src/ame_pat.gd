extends TextureButton
@onready var ame = $"../ame"

var anim: Array[String] = ["ame_smile", "ame_happy"]
var loops = 0

func _ready():
	ame.play("ame_idle")
	$".".pressed.connect(_button_pressed)
	
func _button_pressed():
	var sanim = anim.pick_random()
	ame.play(sanim)
	await ame.animation_looped
	loops += 1
	if loops >= 3:
		ame.play("ame_idle")
	ame.play("ame_idle")
