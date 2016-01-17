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
minetest.register_craftitem("woodtodirt:splitted_stick", {
        description = "splitted stick",
        inventory_image = "woodtodirt_splitted_stick.png",
})
minetest.register_craftitem("woodtodirt:charcoal", {
        description = "Charcoal",
        inventory_image = "woodtodirt_charcoal.png",
})

--
-- New Crafting tools
--
minetest.register_tool("woodtodirt:stone_hammer", {
        description = "Stone Hummer",
        inventory_image = "woodtodirt_stone_hammer.png",
        on_use = function()
            return
        end,
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
	        cooktime = 10,
	})
end
minetest.register_craft({
        type = "cooking",
        output = "woodtodirt:charcoal",
        recipe = "group:tree",
        cooktime = 38,
})
minetest.register_craft({
        type = "cooking",
        output = "woodtodirt:ashes 4",
        recipe = "woodtodirt:charcoal",
        cooktime = 10,
})
minetest.register_craft({
        type = "cooking",
        output = "woodtodirt:ashes 4",
        recipe = "default:coal_lump",
        cooktime = 10,
})
minetest.register_craft({
        type = "cooking",
        output = "woodtodirt:ashes",
        recipe = "group:sapling",
        cooktime = 25,
})
minetest.register_craft({
        type = "cooking",
        output = "woodtodirt:ashes",
        recipe = "comp_blocks:leaves_512x",
        cooktime = 13,
})
minetest.register_craft({
        type = "cooking",
        output = "woodtodirt:ashes 8",
        recipe = "comp_blocks:leaves_4096x",
        cooktime = 15,
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
minetest.register_craft({
        type = "fuel",
        recipe = "woodtodirt:charcoal",
        burntime = 40,
})

--
-- Craft recipes
--
minetest.register_craft({
    output = 'default:torch 4',
    recipe = {
	{'woodtodirt:charcoal'},
    {'group:stick'},
    }
})
minetest.register_craft({
    output = 'default:torch',
    recipe = {
	{'woodtodirt:ashes'},
    {'woodtodirt:splitted_stick'},
    }
})
minetest.register_craft({
	output = "woodtodirt:splitted_stick 4",
	recipe = {{"group:stick"}}
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
	output = "woodtodirt:stone_hammer",
	recipe = {
	{"comp_blocks:cobble_1", "comp_blocks:cobble_1", ""},
	{"comp_blocks:cobble_1", "comp_blocks:cobble_1", "woodtodirt:splitted_stick"},
	{"comp_blocks:cobble_1", "comp_blocks:cobble_1", ""},
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
	minetest.register_craft({
		output = "woodtodirt:stone_hammer",
		recipe = {
		{"moreblocks:cobble_compressed", "moreblocks:cobble_compressed", ""},
		{"moreblocks:cobble_compressed", "moreblocks:cobble_compressed", "woodtodirt:splitted_stick"},
		{"moreblocks:cobble_compressed", "moreblocks:cobble_compressed", ""},
		},
	})
end
if minetest.get_modpath("charcoal") then
	minetest.register_craft({
		output = "woodtodirt:charcoal",
		recipe = {{"charcoal:charcoal_lump"}}
	})
	minetest.register_craft({
		output = "charcoal:charcoal_lump",
		recipe = {{"woodtodirt:charcoal"}}
	})
end

--
--  クラフト時の動作を登録
--
minetest.register_on_craft(function(_, _, old_craft_grid, craft_inv)
	--材料からハンマーを探す
	for i, item in ipairs(old_craft_grid) do
		if item:get_name() == "woodtodirt:stone_hammer" then
			item:add_wear(65535 / 2 + 1)--ハンマーに5割のダメージを追加する
			craft_inv:set_stack("craft", i, item)
		end
	end
end)
