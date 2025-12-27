@tool

extends Node3D

@export var numRows = 1
@export var numCols = 1

@onready var gridBase = $GridBase
@onready var baseBody: CSGBox3D = $GridBase/Base
@onready var cellTemplate = $CellTemplate

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_base_size()
	
	for z in range(numRows):
		for x in range(numCols):
			var cell: CSGBox3D = cellTemplate.duplicate()
			cell.position.x = 0.05 + (x * 0.1)
			cell.position.y = 0.03
			cell.position.z = 0.05 + (z * 0.1)
			cell.visible = true
			gridBase.add_child(cell)
		
func _process(delta):
	if Engine.is_editor_hint():
		set_base_size()
		return

func set_base_size():
	baseBody.size.x = numCols * 0.1
	baseBody.size.z = numRows * 0.1
	baseBody.position.x = baseBody.size.x / 2
	baseBody.position.z = baseBody.size.z / 2
