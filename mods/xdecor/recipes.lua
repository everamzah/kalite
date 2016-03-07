minetest.register_craft({
	output = "realchess:chessboard",
	recipe = {
		{"dye:black", "dye:white", "dye:black"},
		{"stairs:slab_wood", "stairs:slab_wood", "stairs:slab_wood"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "xdecor:crafting_guide",
	recipe = {"default:book"}
})
