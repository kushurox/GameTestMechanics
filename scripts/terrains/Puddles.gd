extends Biome

export var water_depth = 2


func generate():
	var stretch = rng.randi_range(min_stretch, max_stretch)
	var current_height = rng.randi_range(min_height, max_height)
	var y = rng.randi_range(0, water_depth if water_depth <=current_height else current_height)
	gaps = gaps
	var temp = rng.randi_range(3, gaps)
	for x in range(-MaxTilesX, MaxTilesX+1):
		if stretch > 0:
			fill_column(x, current_height)
			stretch -= 1
		else:
			if temp > 0:
				temp -= 1 # Add the water logic here later
				fill_column(x, current_height, y, 1)
				if y != 0:
					fill_column(x, y-1, 0, 0)
				continue
			else:
				stretch = rng.randi_range(min_stretch, max_stretch)
				current_height = rng.randi_range(min_height, max_height)
				fill_column(x, current_height)
				temp = rng.randi_range(3, gaps)
				y = rng.randi_range(1, water_depth if water_depth <=current_height else current_height)
	
	for x in range(-MaxTilesX, MaxTilesX+1):
		for tempy in range(-(MaxTilesY+1), MaxTilesY+1):
			check_side(x, tempy, 1, INVALID_CELL, 0)
	
	
	# Generating collision blocks
	for x in range(-MaxTilesX, MaxTilesX+1):
		for tempy in range(-(MaxTilesY+1), MaxTilesY+1):
			check_neighbhor(x, tempy, Blocks.block_index["ground"], [Blocks.block_index["air"], Blocks.block_index["water"]], Blocks.block_index["ground"])
		
	return 1
