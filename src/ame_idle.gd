extends AnimatedSprite2D

@onready var ame = $"."
@export var idle_time: float = 5.0
@export var idle_max: float = 30.0

var active = false
var animations: Array = []
var loops = 0

func _ready():
	if ame.sprite_frames:
		animations = ame.sprite_frames.get_animation_names() as Array
		animations.erase("ame_idle")
	ame.play("ame_idle")

func _handle_time():
	var time = randf_range(idle_time, idle_max)
	get_tree().create_timer(time).timeout.connect(_handle_animation)
	
func _handle_animation():
	if randi() % 4 == 0:
		var sanimation = animations.pick_random()
		_animate(sanimation)
		active = true
		await animation_looped 
		loops += 1
		if loops >= 3:
			_animate("ame_idle")
			active = false
	
func _animate(sanimation):
	if active: 
		return
	ame.play(sanimation)
	_handle_time()
