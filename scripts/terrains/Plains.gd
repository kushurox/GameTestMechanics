extends Biome

var BiomeColliders = ["collider"]


func generate():
	rng.seed = 2
	var stretch = rng.randi_range(min_stretch, max_stretch)
	var current_height = rng.randi_range(min_height, max_height)
	gaps = gaps + 1
	var temp = randi() % gaps if gaps > 0 else 0
	for x in range(-MaxTilesX, MaxTilesX+1):
		if stretch > 0:
			fill_column(x, current_height)
			stretch -= 1
		else:
			if temp > 0:
				temp -= 1
				continue
			else:
				stretch = rng.randi_range(min_stretch, max_stretch)
				current_height = rng.randi_range(min_height, max_height)
				fill_column(x, current_height)
				temp = randi() % gaps if gaps > 0 else 0
	
	# Generating colliders
	for x in range(-MaxTilesX, MaxTilesX+1):
		for y in range(-MaxTilesY, MaxTilesY+1):
			check_neighbhor(x, y, Blocks.block_index["ground"], Blocks.block_index["air"], Blocks.block_index["collider"])
	
	return 1
