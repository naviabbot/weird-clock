extends Node

@onready var time_csharp = $TimeCSharp

var beats : String
var beat_tai : String
var stardate : String

func _ready():
	time_csharp.set_script(load("res://Time.cs"))

func _process(_delta):
	beats = "@" + time_csharp.beatTime()
	stardate = time_csharp.starDate()
	$Panel/Beats.text = beats
	$Panel/Stardate.text = stardate
	$Panel/DateTime.text = "It is " + _get_da_datetime()
	print(beat_tai)

func _get_da_datetime(datetime := Time.get_datetime_string_from_system(false,true)):
	return datetime


func _on_beats_button_up() -> void:
	$Panel/About_dotBeats.show()
