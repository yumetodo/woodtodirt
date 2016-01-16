--[[
woodtodirt
========

Copyright (c) 2015 yumetodo <yume-wikijp@live.jp>

Version: 1.0

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

minetest.register_craftitem("woodtodirt:ashes", {
        description = "ashes",
        inventory_image = "woodtodirt_ash.png",
})
minetest.register_craftitem("woodtodirt:stone_dust", {
        description = "Stone Dust",
        inventory_image = "woodtodirt_stone_dust.png",
})
minetest.register_craftitem("woodtodirt:sand_dust", {
        description = "Stone Dust",
        inventory_image = "woodtodirt_sand_dust.png",
})
minetest.register_craftitem("woodtodirt:stone_hammer", {
        description = "Stone Hummer",
        inventory_image = "woodtodirt_stone_hammer.png",
})
minetest.register_craftitem("woodtodirt:splitted_stick", {
        description = "splitted stick",
        inventory_image = "woodtodirt_splitted_stick.png",
})
--[[
2016-01-16 21:10:58: ACTION[ServerThread]: player singleplayer crafts comp_blocks:leaves_64x
]]
--
-- register compblock
--
register_compblock("default:cobble", 4, false, true, {})
register_compblock_by_group("leaves", "default:pine_needles", 3, true, false, {})

--
-- Cooking recipes
--
if minetest.get_modpath("charcoal") then
	minetest.register_craft({
	        type = "cooking",
	        output = "woodtodirt:ashes 4",
	        recipe = "charcoal:charcoal_lump",
	        cooktime = 25,
	})
end
minetest.register_craft({
        type = "cooking",
        output = "woodtodirt:ashes 4",
        recipe = "default:coal_lump",
        cooktime = 15,
})
minetest.register_craft({
        type = "cooking",
        output = "woodtodirt:ashes",
        recipe = "group:sapling",
        cooktime = 30,
})
minetest.register_craft({
        type = "cooking",
        output = "woodtodirt:ashes",
        recipe = "comp_blocks:leaves_512x",
        cooktime = 17,
})
minetest.register_craft({
        type = "cooking",
        output = "woodtodirt:ashes 8",
        recipe = "comp_blocks:leaves_4096x",
        cooktime = 18,
})
--
-- fuel recipes
--
minetest.register_craft({
		type = "fuel",
		recipe = "woodtodirt:ashes",
		burntime = 10
})
minetest.register_craft({
		type = "fuel",
		recipe = "woodtodirt:splitted_stick",
		burntime = 4
})
minetest.register_craft({
		type = "fuel",
		recipe = "comp_blocks:leaves_64x",
		burntime = 2
})
minetest.register_craft({
		type = "fuel",
		recipe = "comp_blocks:leaves_512x",
		burntime = 16
})
minetest.register_craft({
		type = "fuel",
		recipe = "comp_blocks:leaves_4096x",
		burntime = 128
})

--
-- Craft recipes
--
minetest.register_craft({
	output = "woodtodirt:splitted_stick 4",
	recipe = {{"moreblocks:jungle_stick"}}
})
minetest.register_craft({
	output = "woodtodirt:splitted_stick 4",
	recipe = {{"default:stick"}}
})
minetest.register_craft({
	output = "woodtodirt:stone_hammer",
	recipe = {
	{"comp_blocks:cobble_1", "comp_blocks:cobble_1", "comp_blocks:cobble_1"},
	{"comp_blocks:cobble_1", "woodtodirt:splitted_stick", "comp_blocks:cobble_1"},
	{"", "woodtodirt:splitted_stick", ""},
	},
})
minetest.register_craft({
	output = "woodtodirt:stone_dust 4",
	recipe = {
	{"default:cobble"},
	{"woodtodirt:stone_hammer"},
	},
})
minetest.register_craft({
	output = "woodtodirt:sand_dust 4",
	recipe = {{"default:sand"}}
})
minetest.register_craft({
	output = "default:dirt",
	recipe = {
	{"comp_blocks:leaves_64x", "woodtodirt:ashes", "comp_blocks:leaves_64x"},
	{"comp_blocks:leaves_64x", "woodtodirt:stone_dust", "comp_blocks:leaves_64x"},
	{"comp_blocks:leaves_64x", "woodtodirt:ashes", "comp_blocks:leaves_64x"},
	},
})
minetest.register_craft({
	output = "default:dirt",
	recipe = {
	{"comp_blocks:leaves_64x", "woodtodirt:ashes", "comp_blocks:leaves_64x"},
	{"comp_blocks:leaves_64x", "woodtodirt:sand_dust", "comp_blocks:leaves_64x"},
	{"comp_blocks:leaves_64x", "woodtodirt:ashes", "comp_blocks:leaves_64x"},
	},
})
minetest.register_craft({
	output = "default:dirt 8",
	recipe = {
	{"comp_blocks:leaves_512x", "woodtodirt:stone_dust", "comp_blocks:leaves_512x"},
	{"comp_blocks:leaves_512x", "woodtodirt:ashes", "comp_blocks:leaves_512x"},
	{"comp_blocks:leaves_512x", "woodtodirt:stone_dust", "comp_blocks:leaves_512x"},
	},
})
minetest.register_craft({
	output = "default:dirt 9",
	recipe = {
	{"comp_blocks:leaves_512x", "woodtodirt:sand_dust", "comp_blocks:leaves_512x"},
	{"comp_blocks:leaves_512x", "woodtodirt:ashes", "comp_blocks:leaves_512x"},
	{"comp_blocks:leaves_512x", "woodtodirt:sand_dust", "comp_blocks:leaves_512x"},
	},
})

if minetest.get_modpath("moreblocks") then--moreblocks has Compressed Cobblestone
	minetest.register_craft({
		output = "comp_blocks:cobble_2",
		recipe = {
		{"moreblocks:cobble_compressed", "moreblocks:cobble_compressed", "moreblocks:cobble_compressed"},
		{"moreblocks:cobble_compressed", "moreblocks:cobble_compressed", "moreblocks:cobble_compressed"},
		{"moreblocks:cobble_compressed", "moreblocks:cobble_compressed", "moreblocks:cobble_compressed"},
		},
	})
	minetest.register_craft({
		output = "woodtodirt:sand_dust 4",
		recipe = {{"default:sand"}}
	})
	minetest.register_craft({
		output = "woodtodirt:stone_hammer",
		recipe = {
		{"moreblocks:cobble_compressed", "moreblocks:cobble_compressed", "moreblocks:cobble_compressed"},
		{"moreblocks:cobble_compressed", "woodtodirt:splitted_stick", "moreblocks:cobble_compressed"},
		{"", "woodtodirt:splitted_stick", ""},
		},
	})
end
