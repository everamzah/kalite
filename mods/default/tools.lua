local function get_groupcaps(uses, group, table)
	uses = uses/3
	local tmp = {
		cracky = {times={
			[default.dig.ice] = 0.75,
			[default.dig.rail] = 1.05,
		}, uses=uses},
		crumbly = {times={
			[default.dig.dirt_with_grass] = 0.9,
			[default.dig.dirt] = 0.75,
			[default.dig.sand] = 0.75,
			[default.dig.gravel] = 0.9,
			[default.dig.clay] = 0.9,
			[default.dig.nethersand] = 0.75,
			[default.dig.snow] = 0.5,
			[default.dig.hardclay] = 3, --6.25,
		}, uses=uses},
		choppy = {times={
			[default.dig.tree] = 3,
			[default.dig.wood] = 3,
			[default.dig.bookshelf] = 2.25,
			[default.dig.fence] = 3,
			[default.dig.sign] = 1.5,
			[default.dig.chest] = 3.75,
			[default.dig.wooden_door] = 4.5,
			[default.dig.workbench] = 3.75,
			[default.dig.pressure_plate_wood] = 0.75,
			[default.dig.deadtree] = 1.5,
			[default.dig.old_chest] = 2,
		}, uses=uses},
		snappy = {times={
			[default.dig.leaves] = 0.3,
			[default.dig.wool] = 1.2,
			[default.dig.flowers] = 0.15,
		}, uses=uses},
		dig = {times={
			[default.dig.bed] = 0.3,
			[default.dig.cactus] = 0.6,
			[default.dig.glass] = 0.45,
			[default.dig.ladder] = 0.6,
			[default.dig.glowstone] = 0.45,
			[default.dig.lever] = 0.75,
			[default.dig.button] = 0.75,
			[default.dig.instant] = 0,
		}, uses=uses},
	}
	if group and table then
		tmp[group] = table
	end
	return tmp
end

-- The hand
minetest.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = {x = 1, y = 1, z = 2.5},
	tool_capabilities = {
		groupcaps = get_groupcaps(0),
		full_punch_interval = 1,
		damage_groups = {fleshy = 1},
	}
})

--
-- Picks
--

minetest.register_tool("default:pick_wood", {
	description = "Wooden Pickaxe",
	inventory_image = "default_tool_woodpick.png",
	tool_capabilities = {
		groupcaps = get_groupcaps(60, "cracky",
			{times = {
				[default.dig.stone] = 1.15,
				[default.dig.cobble] = 1.5,
				[default.dig.coal] = 2.25,
				[default.dig.sandstone] = 0.6,
				[default.dig.furnace] = 2.65,
				[default.dig.ice] = 0.4,
				[default.dig.rail] = 0.55,
				[default.dig.iron_door] = 3.75,
				[default.dig.netherrack] = 0.3,
				[default.dig.netherbrick] = 1.5,
				[default.dig.brick] = 1.5,
				[default.dig.pressure_plate_stone] = 0.4,
			}, uses = 60 / 3}
		),
		full_punch_interval = 1,
		damage_groups = {fleshy = 1},
	},
})
minetest.register_tool("default:pick_stone", {
	description = "Stone Pickaxe",
	inventory_image = "default_tool_stonepick.png",
	tool_capabilities = {
		groupcaps = get_groupcaps(132, "cracky",
			{times = {
				[default.dig.stone] = 0.6,
				[default.dig.cobble] = 0.75,
				[default.dig.coal] = 1.15,
				[default.dig.iron] = 1.15,
				[default.dig.sandstone] = 0.3,
				[default.dig.furnace] = 1.35,
				[default.dig.ironblock] = 1.9,
				[default.dig.ice] = 0.2,
				[default.dig.rail] = 0.3,
				[default.dig.iron_door] = 1.9,
				[default.dig.netherrack] = 0.15,
				[default.dig.netherbrick] = 0.75,
				[default.dig.brick] = 0.75,
				[default.dig.pressure_plate_stone] = 0.2,
			}, uses = 132 / 3}
		),
		full_punch_interval = 1,
		damage_groups = {fleshy = 1},
	},
})
minetest.register_tool("default:pick_iron", {
	description = "Iron Pickaxe",
	inventory_image = "default_tool_ironpick.png",
	tool_capabilities = {
		groupcaps = get_groupcaps(151, "cracky",
			{times = {
				[default.dig.stone] = 0.4,
				[default.dig.cobble] = 0.5,
				[default.dig.coal] = 0.75,
				[default.dig.iron] = 0.75,
				[default.dig.gold] = 0.75,
				[default.dig.diamond] = 0.75,
				[default.dig.sandstone] = 0.2,
				[default.dig.furnace] = 0.9,
				[default.dig.ironblock] = 1.25,
				[default.dig.goldblock] = 0.75,
				[default.dig.diamondblock] = 1.25,
				[default.dig.ice] = 0.15,
				[default.dig.rail] = 0.2,
				[default.dig.iron_door] = 1.25,
				[default.dig.netherrack] = 0.1,
				[default.dig.netherbrick] = 0.5,
				[default.dig.redstone_ore] = 0.75,
				[default.dig.brick] = 0.5,
				[default.dig.pressure_plate_stone] = 0.15,
			}, uses = 251 / 3}
		),
		full_punch_interval = 1,
		damage_groups = {fleshy = 1},
	},
})

minetest.register_alias("default:pick_diamond", "default:pick_bronze")
minetest.register_tool("default:pick_bronze", {
	description = "Bronze Pickaxe",
	inventory_image = "default_tool_bronzepick.png",
	tool_capabilities = {
		groupcaps = get_groupcaps(1562, "cracky",
			{times = {
				[default.dig.stone] = 0.3,
				[default.dig.cobble] = 0.4,
				[default.dig.coal] = 0.6,
				[default.dig.iron] = 0.6,
				[default.dig.gold] = 0.6,
				[default.dig.diamond] = 0.6,
				[default.dig.sandstone] = 0.15,
				[default.dig.furnace] = 0.7,
				[default.dig.ironblock] = 0.95,
				[default.dig.goldblock] = 0.6,
				[default.dig.diamondblock] = 0.95,
				[default.dig.obsidian] = 4, --9.4,
				[default.dig.ice] = 0.1,
				[default.dig.rail] = 0.15,
				[default.dig.iron_door] = 0.95,
				[default.dig.netherrack] = 0.1,
				[default.dig.netherbrick] = 0.4,
				[default.dig.redstone_ore] = 0.6,
				[default.dig.brick] = 0.4,
				[default.dig.pressure_plate_stone] = 0.1,
			}, uses = 1562 / 3}
		),
		full_punch_interval = 1,
		damage_groups = {fleshy = 1},
	},
})

minetest.register_alias("default:pick_gold2", "default:pick_admin")
minetest.register_tool("default:pick_admin", {
	description = "Admin Pickaxe",
	inventory_image = "default_tool_goldpick.png",
	tool_capabilities = {
		groupcaps = get_groupcaps(33, "cracky",
			{times = {[0]=0,[1]=0,[2]=0,[3]=0,
				[default.dig.stone] = 0,
				[default.dig.cobble] = 0,
				[default.dig.coal] = 0,
				[default.dig.sandstone] = 0,
				[default.dig.furnace] = 0,
				[default.dig.ice] = 0,
				[default.dig.rail] = 0,
				[default.dig.iron_door] = 0,
				[default.dig.netherrack] = 0,
				[default.dig.netherbrick] = 0,
				[default.dig.brick] = 0,
				[default.dig.pressure_plate_stone] = 0,
				[default.dig.iron] = 0,
				[default.dig.gold] = 0,
				[default.dig.diamond] = 0,
				[default.dig.ironblock] = 0,
				[default.dig.goldblock] = 0,
				[default.dig.diamondblock] = 0,
				[default.dig.obsidian] = 0,
				[default.dig.redstone_ore] = 0,
				[default.dig.dirt_with_grass] = 0,
				[default.dig.dirt] = 0,
				[default.dig.sand] = 0,
				[default.dig.gravel] = 0,
				[default.dig.clay] = 0,
				[default.dig.snow] = 0,
				[default.dig.snowblock] = 0,
				[default.dig.nethersand] = 0,
				[default.dig.hardclay] = 0,
				[default.dig.tree] = 0,
				[default.dig.wood] = 0,
				[default.dig.bookshelf] = 0,
				[default.dig.fence] = 0,
				[default.dig.sign] = 0,
				[default.dig.chest] = 0,
				[default.dig.wooden_door] = 0,
				[default.dig.workbench] = 0,
				[default.dig.pressure_plate_wood] = 0,
				[default.dig.deadtree] = 0,
				[default.dig.old_chest] = 0,
				[default.dig.leaves] = 0,
				[default.dig.wool] = 0,
				[default.dig.bed] = 0,
				[default.dig.cactus] = 0,
				[default.dig.glass] = 0,
				[default.dig.ladder] = 0,
				[default.dig.glowstone] = 0,
				[default.dig.lever] = 0,
				[default.dig.button] = 0,
				[default.dig.instant] = 0
			}, uses = 0, maxlevel = 99}
		),
		full_punch_interval = 1,
		damage_groups = {fleshy = 1000},
	}
})

--
-- Shovels
--

minetest.register_tool("default:shovel_wood", {
	description = "Wooden Shovel",
	inventory_image = "default_tool_woodshovel.png",
	tool_capabilities = {
		groupcaps = get_groupcaps(60, "crumbly",
			{times = {
				[default.dig.dirt_with_grass] = 0.45,
				[default.dig.dirt] = 0.4,
				[default.dig.sand] = 0.4,
				[default.dig.gravel] = 0.45,
				[default.dig.clay] = 0.45,
				[default.dig.snow] = 0.1,
				[default.dig.snowblock] = 0.15,
				[default.dig.nethersand] = 0.4,
			}, uses = 60 / 3}
		),
		full_punch_interval = 1,
		damage_groups = {fleshy = 1},
	},
})
minetest.register_tool("default:shovel_stone", {
	description = "Stone Shovel",
	inventory_image = "default_tool_stoneshovel.png",
	tool_capabilities = {
		groupcaps = get_groupcaps(132, "crumbly",
			{times = {
				[default.dig.dirt_with_grass] = 0.25,
				[default.dig.dirt] = 0.2,
				[default.dig.sand] = 0.2,
				[default.dig.gravel] = 0.25,
				[default.dig.clay] = 0.25,
				[default.dig.snow] = 0.05,
				[default.dig.snowblock] = 0.1,
				[default.dig.nethersand] = 0.2,
			}, uses = 132 / 3}
		),
		full_punch_interval = 1,
		damage_groups = {fleshy = 1},
	},
})
minetest.register_tool("default:shovel_iron", {
	description = "Iron Shovel",
	inventory_image = "default_tool_ironshovel.png",
	tool_capabilities = {
		groupcaps = get_groupcaps(251, "crumbly",
			{times = {
				[default.dig.dirt_with_grass] = 0.15,
				[default.dig.dirt] = 0.15,
				[default.dig.sand] = 0.15,
				[default.dig.gravel] = 0.15,
				[default.dig.clay] = 0.15,
				[default.dig.snow] = 0.05,
				[default.dig.snowblock] = 0.05,
				[default.dig.nethersand] = 0.15,
			}, uses=251 / 3}
		),
		full_punch_interval = 1,
		damage_groups = {fleshy = 1},
	},
})

minetest.register_alias("default:shovel_diamond", "default:shovel_bronze")
minetest.register_tool("default:shovel_bronze", {
	description = "Bronze Shovel",
	inventory_image = "default_tool_bronzeshovel.png",
	tool_capabilities = {
		groupcaps = get_groupcaps(1562, "crumbly",
			{times = {
				[default.dig.dirt_with_grass] = 0.15,
				[default.dig.dirt] = 0.1,
				[default.dig.sand] = 0.1,
				[default.dig.gravel] = 0.15,
				[default.dig.clay] = 0.15,
				[default.dig.snow] = 0.05,
				[default.dig.snowblock] = 0.05,
				[default.dig.nethersand] = 0.1,
			}, uses = 1562 / 3}
		),
		full_punch_interval = 1,
		damage_groups = {fleshy = 1},
	},
})

--
-- Axes
--

minetest.register_tool("default:axe_wood", {
	description = "Wooden Axe",
	inventory_image = "default_tool_woodaxe.png",
	tool_capabilities = {
		groupcaps = get_groupcaps(60, "choppy",
			{times = {
				[default.dig.tree] = 1.5,
				[default.dig.wood] = 1.5,
				[default.dig.bookshelf] = 1.15,
				[default.dig.fence] = 1.5,
				[default.dig.sign] = 0.75,
				[default.dig.chest] = 1.9,
				[default.dig.wooden_door] = 2.25,
				[default.dig.workbench] = 1.9,
				[default.dig.pressure_plate_wood] = 0.4,
				[default.dig.deadtree] = 0.75,
				[default.dig.old_chest] = 0.75,
			}, uses = 60 / 3}
		),
		full_punch_interval = 1,
		damage_groups = {fleshy = 1},
	},
})
minetest.register_tool("default:axe_stone", {
	description = "Stone Axe",
	inventory_image = "default_tool_stoneaxe.png",
	tool_capabilities = {
		groupcaps = get_groupcaps(132, "choppy",
			{times = {
				[default.dig.tree] = 0.75,
				[default.dig.wood] = 0.75,
				[default.dig.bookshelf] = 0.6,
				[default.dig.fence] = 0.75,
				[default.dig.sign] = 0.4,
				[default.dig.chest] = 0.95,
				[default.dig.wooden_door] = 1.15,
				[default.dig.workbench] = 0.95,
				[default.dig.pressure_plate_wood] = 0.2,
				[default.dig.deadtree] = 0.4,
				[default.dig.old_chest] = 0.4,
			}, uses = 132 / 3}
		),
		full_punch_interval = 1,
		damage_groups = {fleshy = 1},
	},
})
minetest.register_tool("default:axe_iron", {
	description = "Iron Axe",
	inventory_image = "default_tool_ironaxe.png",
	tool_capabilities = {
		groupcaps = get_groupcaps(251, "choppy",
			{times = {
				[default.dig.tree] = 0.5,
				[default.dig.wood] = 0.5,
				[default.dig.bookshelf] = 0.4,
				[default.dig.fence] = 0.5,
				[default.dig.sign] = 0.25,
				[default.dig.chest] = 0.65,
				[default.dig.wooden_door] = 0.75,
				[default.dig.workbench] = 0.65,
				[default.dig.pressure_plate_wood] = 0.15,
				[default.dig.deadtree] = 0.25,
				[default.dig.old_chest] = 0.25,
			}, uses = 251 / 3}
		),
		full_punch_interval = 1,
		damage_groups = {fleshy = 1},
	},
})

minetest.register_alias("default:axe_diamond", "default:axe_bronze")
minetest.register_tool("default:axe_bronze", {
	description = "Bronze Axe",
	inventory_image = "default_tool_bronzeaxe.png",
	tool_capabilities = {
		groupcaps = get_groupcaps(1562, "choppy",
			{times = {
				[default.dig.tree] = 0.4,
				[default.dig.wood] = 0.4,
				[default.dig.bookshelf] = 0.3,
				[default.dig.fence] = 0.4,
				[default.dig.sign] = 0.2,
				[default.dig.chest] = 0.5,
				[default.dig.wooden_door] = 0.6,
				[default.dig.workbench] = 0.5,
				[default.dig.pressure_plate_wood] = 0.1,
				[default.dig.deadtree] = 0.2,
				[default.dig.old_chest] = 0.2,
			}, uses = 1562 / 3}
		),
		full_punch_interval = 1,
		damage_groups = {fleshy = 1},
	},
})

--
-- Swords
--

minetest.register_tool("default:sword_wood", {
	description = "Wooden Sword",
	inventory_image = "default_tool_woodsword.png",
	tool_capabilities = {
		groupcaps = get_groupcaps(30, "snappy",
			{times = {
				[default.dig.leaves] = 0.2,
				[default.dig.wool] = 1.2,
			}, uses = 30 / 3}
		),
		full_punch_interval = 1,
		damage_groups = {fleshy = 2},
	}
})

minetest.register_tool("default:sword_stone", {
	description = "Stone Sword",
	inventory_image = "default_tool_stonesword.png",
	tool_capabilities = {
		groupcaps = get_groupcaps(66, "snappy",
			{times = {
				[default.dig.leaves] = 0.2,
				[default.dig.wool] = 1.2,
			}, uses = 66 / 3}
		),
		full_punch_interval = 1,
		damage_groups = {fleshy = 3},
	}
})

minetest.register_tool("default:sword_iron", {
	description = "Iron Sword",
	inventory_image = "default_tool_ironsword.png",
	tool_capabilities = {
		ggroupcaps = get_groupcaps(125, "snappy",
			{times = {
				[default.dig.leaves] = 0.2,
				[default.dig.wool] = 1.2,
			}, uses = 125 / 3}
		),
		full_punch_interval = 1,
		damage_groups = {fleshy = 4},
	}
})

minetest.register_alias("default:sword_diamond", "default:sword_bronze")
minetest.register_tool("default:sword_bronze", {
	description = "Bronze Sword",
	inventory_image = "default_tool_bronzesword.png",
	tool_capabilities = {
		groupcaps = get_groupcaps(551, "snappy",
			{times = {
				[default.dig.leaves] = 0.2,
				[default.dig.wool] = 1.2,
			}, uses = 551 / 3}
		),
		full_punch_interval = 1.8,
		damage_groups = {fleshy = 5},
	}
})
