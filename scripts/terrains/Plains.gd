extends Biome




func generate():
	rng.seed = 2
	var stretch = rng.randi_range(min_stretch, max_stretch)
	var current_height = rng.randi_range(min_height, max_height)
	gaps = gaps + 1
	var temp = randi() % gaps if gaps > 0 else 0
	for x in MaxTilesX:
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
		
	return 1
