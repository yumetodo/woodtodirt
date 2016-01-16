--[[
woodtodart
========

Copyright (c) 2015 yumetodo <yume-wikijp@live.jp>

Version: 1.0

Depends: charcoal
https://forum.minetest.net/viewtopic.php?f=11&t=3971

License for code:
MIT License
(http://opensource.org/licenses/mit-license.php)

License for texture:
Attribution 4.0 International (CC BY 4.0)
(https://creativecommons.org/licenses/by/4.0/)
--]]

dofile(minetest.get_modpath("woodtodirt").."/comp_blocks_utility.lua")

local modname = "woodtodirt"
--
-- New Crafting items
--

minetest.register_craftitem("woodtodart:ashes", {
        description = "ashes",
        inventory_image = "ash.png",
})
minetest.register_craftitem("woodtodart:stone_dust", {
        description = "Stone Dust",
        inventory_image = "stone_dust.png",
})
minetest.register_craftitem("woodtodart:sand_dust", {
        description = "Stone Dust",
        inventory_image = "sand_dust.png",
})
minetest.register_craftitem("woodtodart:stone_hummer", {
        description = "Stone Hummer",
        inventory_image = "Stone_Hummer.png",
})
minetest.register_craftitem("woodtodart:splitted_stick", {
        description = "splitted stick",
        inventory_image = "splitted_stick.png",
})

--
-- register compblock
--
register_compblock("default:cobble", 4, false, true)
register_compblock_by_group("leaves", "default:pine_needles", 3, true, false)

--
-- Cooking recipes
--
minetest.register_craft({
        type = "cooking",
        output = "woodtodart:ashes 4",
        recipe = "charcoal:charcoal_lump",
        cooktime = 35,
})
minetest.register_craft({
        type = "cooking",
        output = "woodtodart:ashes 4",
        recipe = "default:coal_lump",
        cooktime = 25,
})
minetest.register_craft({
        type = "cooking",
        output = "woodtodart:ashes",
        recipe = "group:sapling",
        cooktime = 45,
})


--[[

------------------------------------------
--------       Craft Recipe       --------
------------------------------------------
Stick　-> splitted stick x 4

Cobblestone	Cobblestone	Cobblestone
Cobblestone	Cobblestone	Cobblestone	->	Compressed Cobblestone (1)
Cobblestone	Cobblestone	Cobblestone

Compressed Cobblestone (1) -> Cobblestone x 9

Compressed Cobblestone (1)	Compressed Cobblestone (1)	Compressed Cobblestone (1)
Compressed Cobblestone (1)	splitted stick				Compressed Cobblestone (1)	->	StoneHummer
							splitted stick

Cobblestone
StoneHummer	->	Cobblestone Dust x 4

Sand	->	Sand Dust x 4

group:Leaves	group:Leaves	group:Leaves
group:Leaves					group:Leaves	->	8x Compressed Leaves
group:Leaves	group:Leaves	group:Leaves

8x Compressed Leaves	8x Compressed Leaves	8x Compressed Leaves
8x Compressed Leaves							8x Compressed Leaves	->	64x Compressed Leaves
8x Compressed Leaves	8x Compressed Leaves	8x Compressed Leaves

64x Compressed Leaves	64x Compressed Leaves	64x Compressed Leaves
64x Compressed Leaves							64x Compressed Leaves	->	512x Compressed Leaves
64x Compressed Leaves	64x Compressed Leaves	64x Compressed Leaves

64x Compressed Leaves	ashes				64x Compressed Leaves
64x Compressed Leaves	Cobblestone Dust	64x Compressed Leaves	->	Dirt
64x Compressed Leaves	ashes				64x Compressed Leaves

64x Compressed Leaves	ashes		64x Compressed Leaves
64x Compressed Leaves	Sand Dust	64x Compressed Leaves	->	Dirt
64x Compressed Leaves	ashes		64x Compressed Leaves

512x Compressed Leaves	Cobblestone Dust	512x Compressed Leaves
512x Compressed Leaves	ashes				512x Compressed Leaves	->	Dirt x 8
512x Compressed Leaves	Cobblestone Dust	512x Compressed Leaves

512x Compressed Leaves	Sand Dust	512x Compressed Leaves
512x Compressed Leaves	ashes		512x Compressed Leaves	->	Dirt x 9
512x Compressed Leaves	Sand Dust	512x Compressed Leaves

:comp_blocks:[元アイテムの名前]_[8^i]x
comp_blocks:leaves_64x
comp_blocks:leaves_512x
default:cobble
default:stick
default:sand
default:dirt
moreblocks:cobble_compressed
comp_blocks:cobble_1
default:pine_needles
]]
minetest.register_craft({
	output = "woodtodart:splitted_stick　4",
	recipe = {{"default:stick"}}
})
minetest.register_craft({
	output = "woodtodart:stone_hummer",
	recipe = {
	{"comp_blocks:cobble_1", "comp_blocks:cobble_1", "comp_blocks:cobble_1"},
	{"comp_blocks:cobble_1", "woodtodart:splitted_stick", "comp_blocks:cobble_1"},
	{"", "woodtodart:splitted_stick", ""},
	},
})
minetest.register_craft({
	output = "woodtodart:stone_dust 4",
	recipe = {
	{"default:cobble"},
	{"woodtodart:stone_hummer"},
	},
})
minetest.register_craft({
	output = "woodtodart:sand_dust　4",
	recipe = {{"default:sand"}}
})
minetest.register_craft({
	output = "default:dirt",
	recipe = {
	{"comp_blocks:leaves_64x", "woodtodart:ashes", "comp_blocks:leaves_64x"},
	{"comp_blocks:leaves_64x", "woodtodart:stone_dust", "comp_blocks:leaves_64x"},
	{"comp_blocks:leaves_64x", "woodtodart:ashes", "comp_blocks:leaves_64x"},
	},
})
minetest.register_craft({
	output = "default:dirt",
	recipe = {
	{"comp_blocks:leaves_64x", "woodtodart:ashes", "comp_blocks:leaves_64x"},
	{"comp_blocks:leaves_64x", "woodtodart:sand_dust", "comp_blocks:leaves_64x"},
	{"comp_blocks:leaves_64x", "woodtodart:ashes", "comp_blocks:leaves_64x"},
	},
})
minetest.register_craft({
	output = "default:dirt 8",
	recipe = {
	{"comp_blocks:leaves_512x", "woodtodart:stone_dust", "comp_blocks:leaves_512x"},
	{"comp_blocks:leaves_512x", "woodtodart:ashes", "comp_blocks:leaves_512x"},
	{"comp_blocks:leaves_512x", "woodtodart:stone_dust", "comp_blocks:leaves_512x"},
	},
})
minetest.register_craft({
	output = "default:dirt 9",
	recipe = {
	{"comp_blocks:leaves_512x", "woodtodart:sand_dust", "comp_blocks:leaves_512x"},
	{"comp_blocks:leaves_512x", "woodtodart:ashes", "comp_blocks:leaves_512x"},
	{"comp_blocks:leaves_512x", "woodtodart:sand_dust", "comp_blocks:leaves_512x"},
	},
})

if minetest.get_modpath("moreblocks") ~= nil then--moreblocks has Compressed Cobblestone
	minetest.register_craft({
		output = "comp_blocks:cobble_2",
		recipe = {
		{"moreblocks:cobble_compressed", "moreblocks:cobble_compressed", "moreblocks:cobble_compressed"},
		{"moreblocks:cobble_compressed", "moreblocks:cobble_compressed", "moreblocks:cobble_compressed"},
		{"moreblocks:cobble_compressed", "moreblocks:cobble_compressed", "moreblocks:cobble_compressed"},
		},
	})
	minetest.register_craft({
		output = "woodtodart:sand_dust　4",
		recipe = {{"default:sand"}}
	})
	minetest.register_craft({
		output = "woodtodart:stone_hummer",
		recipe = {
		{"moreblocks:cobble_compressed", "moreblocks:cobble_compressed", "moreblocks:cobble_compressed"},
		{"moreblocks:cobble_compressed", "woodtodart:splitted_stick", "moreblocks:cobble_compressed"},
		{"", "woodtodart:splitted_stick", ""},
		},
	})
end
