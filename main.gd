extends Node

@onready var time_csharp = $TimeCSharp

var beats : String
var beat_tai : String
var stardate : String

func _ready():
	time_csharp.set_script(load("res://Time.cs"))

func _process(_delta):
	beats = "@" + time_csharp.beatTime()
	beat_tai = ":" + time_csharp.beatTaiTime()
	stardate = time_csharp.starDate()
	$Panel/Beats.text = beats
	$Panel/beatTai.text = beat_tai
	$Panel/Stardate.text = stardate
	$Panel/DateTime.text = "It is " + _get_da_datetime()

func _get_da_datetime(datetime := Time.get_datetime_string_from_system(false,true)):
	return datetime


func _on_beats_button_up() -> void:
	$Panel/About_dotBeats.show()


func _on_beat_tai_button_up() -> void:
	$Panel/About_dotTai.show()
