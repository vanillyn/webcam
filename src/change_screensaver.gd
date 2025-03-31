extends TextureButton

@onready var pc = $"../ame_background_screensaver"
@export var screen: int

func _ready():
	pc.play("default")
	pc.pause()
	$".".pressed.connect(_button_pressed)
	
func _button_pressed():
	var fmax = pc.sprite_frames.get_frame_count("default")
	var next = pc.frame + 1
	if next >= fmax:
		next = 0
	pc.frame = next
