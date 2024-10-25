extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset_and_animate_boat_rot()
	reset_and_animate_boat_bob()
	reset_and_animate_water()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func reset_and_animate_boat_bob():
	var tween = get_tree().create_tween()
	tween.tween_property($Boat, "position:y", 370.0, 2).from(440.0).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_SINE)
	tween.tween_property($Boat, "position:y", 440.0, 2).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_SINE)
	tween.connect("finished", Callable(self, "on_finished_anim_boat_bob"))

func on_finished_anim_boat_bob():
	reset_and_animate_boat_bob()




func reset_and_animate_boat_rot():
	var tween = get_tree().create_tween()
	tween.tween_property($Boat, "rotation", deg_to_rad(5.0), 2).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_SINE)
	tween.tween_property($Boat, "rotation", deg_to_rad(-5.0), 2).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_SINE)
	tween.connect("finished", Callable(self, "on_finished_anim_boat_rot"))

func on_finished_anim_boat_rot():
	reset_and_animate_boat_rot()

func reset_and_animate_water():
	var tween = get_tree().create_tween()
	tween.tween_property($Water, "position:x", 245.0, 1).from(0.0)
	tween.connect("finished", Callable(self, "on_finished_anim_water"))


func on_finished_anim_water():
	reset_and_animate_water()
