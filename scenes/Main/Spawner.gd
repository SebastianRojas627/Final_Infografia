extends Node2D

const WIDTH = 1366
const HEIGHT = 768
const SKELETON = preload("res://scenes/Enemy/Skeleton/Skeleton.tscn")
const NIGHTBORNE = preload("res://scenes/Enemy/Nightborne/Nightborne.tscn")

var spawn_area = Rect2()

var delta = 5
var offset = 3

func _ready():
	randomize()
	spawn_area = Rect2(0, 0, WIDTH, HEIGHT)
	set_next_spawn()
	
func spawn_enemy():
	var position = Vector2(randi()%WIDTH, (randi()%HEIGHT) + HEIGHT)
	var randomN = randf()
	var enemy
	if randomN > 0.85:
		enemy = NIGHTBORNE.instance()
	else:
		enemy = SKELETON.instance()
	enemy.position = position
	$"../".add_child(enemy)
	return position
	
func set_next_spawn():
	var next_time = delta + (randf()-0.5)*2*offset
	$Timer.wait_time = next_time
	$Timer.start()
	
func _on_Timer_timeout():
	spawn_enemy()
	set_next_spawn()

#func _draw():
#	var radius = 5
#	draw_rect(spawn_area, Color.red, 0.5)
#
#	for i in range(12):
#		draw_circle(spawn_enemy(), radius, Color.blue)
