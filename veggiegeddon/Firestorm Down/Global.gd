extends Node

var VP = Vector2.ZERO

var score = 0
var time = 100
var lives = 5

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	randomize()
	VP = Vector2(5600,1500)
	var _signal = get_tree().get_root().connect("size_changed", self, "_resize")
  #P = get_viewport().size


func _resize():
	pass
  #VP = get_viewport().size

func reset():
  get_tree().paused = false
  score = 0
  time = 100
  lives = 5

func update_score(s):
	score += s
	var Score = get_node_or_null("/root/Game/UI/HUD/Score")
	if Score != null:
		Score.text = "Score: " + str(score)
func update_lives(l):
	lives += l
	if lives <= 0:
		var _scene = get_tree().change_scene("res://UI/End Game.tscn")
	var Lives = get_node_or_null("/root/Game/UI/HUD/Lives")
	if Lives != null:
		Lives.text = "Lives: " + str(lives)
func update_time(t):
	time += t
	if time <= 0:
		var _scene = get_tree().change_scene("res://UI/End Game.tscn")
	var Time = get_node_or_null("/root/Game/UI/HUD/Time")
	if Time != null:
		Time.text = "Time: " + str(time)
