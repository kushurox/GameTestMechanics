class_name Blocks


const block_index = {
	"air": -1,
	"ground": 0,
	"water": 1,
	"collider": 2
}

var block_name: String
var group: String
var can_collide: bool
var special_property: Dictionary
var id: int


func _init(bn: String, grp: String, special: Dictionary={}):
	self.block_name = bn
	self.group = grp
	self.special_property = special
	self.id = self.block_index[bn]
	if bn in self.collidables:
		self.can_collide = true
