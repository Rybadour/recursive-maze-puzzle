@tool

extends Node3D

@export var numRows = 1
@export var numCols = 1
@export var dollHouseScale = false;

@onready var gridBase = $GridBase
@onready var baseBody: CSGBox3D = $GridBase/Base
@onready var cellTemplate = $CellTemplate

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_base_size()
	
	var scale = getScale()
	for z in range(numRows):
		for x in range(numCols):
			var cell: CSGBox3D = cellTemplate.duplicate()
			cell.position.x = scale/2 + (x * scale)
			cell.position.y = 0.03 if dollHouseScale else 0.5
			cell.position.z = scale/2 + (z * scale)
			cell.size.x = scale * 0.9
			cell.size.y = 0.02 if dollHouseScale else 0.8
			cell.size.z = scale * 0.9
			cell.visible = true
			gridBase.add_child(cell)
		
func _process(delta):
	if Engine.is_editor_hint():
		set_base_size()
		return

func set_base_size():
	baseBody.size.x = numCols * getScale()
	baseBody.size.y = 0.05 if dollHouseScale else 0.4
	baseBody.size.z = numRows * getScale()
	baseBody.position.x = baseBody.size.x / 2
	baseBody.position.z = baseBody.size.z / 2
	
func getScale():
	return 0.1 if dollHouseScale else 4
