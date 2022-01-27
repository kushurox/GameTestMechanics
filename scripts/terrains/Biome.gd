extends TileMap

class_name Biome

var start_pos = []
var tile_size = 32
export var width = 0
export var height = 0

var MaxTilesX
var MaxTilesY

var rng = RandomNumberGenerator.new()


export(int) var min_height = 1
export(int) var max_height = 5
export(int) var min_stretch = 3
export(int) var max_stretch = 12
export(int) var gaps = 0


func map_tiles(x: int, y: int) -> Vector2:
	return Vector2(x, MaxTilesY-y)

func fill_column(x: int, ch: int, target_height: int=0, tile_index: int=0):
	while ch >= target_height:
		self.set_cellv(map_tiles(x, ch), tile_index)
		ch -= 1


func check_neighbhor(x: int, y: int, target_tile: int, old_tile: int, new_tile: int):
	if self.get_cell(x, y) == target_tile:
		if self.get_cell(x-1, y) == old_tile or self.get_cell(x+1, y) == old_tile or self.get_cell(x, y+1) == old_tile or self.get_cell(x, y-1) == old_tile:
			self.set_cell(x, y, new_tile)


func check_side(x: int, y: int, target_tile: int, old_tile: int, new_tile: int):
	if self.get_cell(x, y) == target_tile:
		if self.get_cell(x-1, y) == old_tile:
			self.set_cell(x-1, y, new_tile)
		elif self.get_cell(x+1, y) == old_tile:
			self.set_cell(x+1, y, new_tile)


func generate():
	return 0

func _ready():
	set_process(false)
	height = ProjectSettings.get_setting("display/window/size/height") if not height else height
	width = ProjectSettings.get_setting("display/window/size/width") if not width else width
	MaxTilesY = (height/tile_size)-1
	MaxTilesX = width/tile_size
	
	print("Dimensions (%d, %d)" % [MaxTilesX, MaxTilesY])
	var res = generate()
	if not res:
		print("Biome Generation not implemented")
