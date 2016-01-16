--[[
License for code:
  Copyright (C) 2016 yumetodo <yume-wikijp@live.jp>
  https://github.com/yumetodo/woodtodirt
  Distributed under the Boost Software License, Version 1.0.
  (See http://www.boost.org/LICENSE_1_0.txt)
--]]

--[[
@brief is_center_nullによってdescriptionを作り分ける
@param base_description 元の説明
@param is_center_null "register_compblock", "register_compblock_by_group"関数に指定するis_center_null
@param comp_level なん段階目の圧縮か
@return 生成された名前。
]]
function register_compblock_impl_make_new_description(base_description, is_center_null, comp_level)
	return is_center_null and 8^comp_level.."x Compressed "..base_description or "Compressed "..base_description.." ("..comp_level..")"
end
--[[
@brief is_center_nullによってnode名を作り分ける
@param base_name 元の名前
@param is_center_null "register_compblock", "register_compblock_by_group"関数に指定するis_center_null
@param comp_level なん段階目の圧縮か
@return 生成された名前。"comp_blocks:"から始まる
]]
function register_compblock_impl_make_new_name(base_name, is_center_null, comp_level)
	local re = is_center_null and "_"..8^comp_level.."x" or "_"..comp_level
	return "comp_blocks:"..base_name..re
end
--[[
@brief 圧縮・解凍レシピの登録
@param pre_nodename 圧縮前のnode/group名
@param new_nodename 圧縮後のnode名
@param is_center_null "register_compblock", "register_compblock_by_group"関数に指定するis_center_null
@param do_decompress_flag trueで解凍レシピ追加、falseで追加しない
]]
function register_compblock_impl_register_craft(pre_nodename, new_nodename, is_center_null, do_decompress_flag)
	if is_center_null then
		minetest.register_craft({
			output = new_nodename,
			recipe = {
				{pre_nodename, pre_nodename, pre_nodename},
				{pre_nodename, '', pre_nodename},
				{pre_nodename, pre_nodename, pre_nodename}
			}
		})
	else--is_center_null
		minetest.register_craft({
			output = new_nodename,
			recipe = {
				{pre_nodename, pre_nodename, pre_nodename},
				{pre_nodename, pre_nodename, pre_nodename},
				{pre_nodename, pre_nodename, pre_nodename}
			}
		})
	end--is_center_null
	if do_decompress_flag then
		local decomp_re_p_num = is_center_null and 8 or 9--Cなら(is_center_null) ? 8 : 9; booleanを暗黙にarithmeticに変換できないので致し方なし
		minetest.register_craft({
			output = pre_nodename.." "..decomp_re_p_num,
			recipe = {{new_nodename}}
		})
	end--do_decompress_flag
end
--[[
@brief 圧縮部ロック系を登録する
@param recipe 元にするブロック名。"default:acacia_tree"みたいに
@param max_comp_level 圧縮のレベル。1以上。
@param is_center_null 中央空白の8個圧縮のレシピにするか(true)否か(false)
@param do_decompress_flag trueで解凍レシピ追加、falseで追加しない
@param group minetest.register_nodeに指定するgroupのtable。{}を推奨
@detail


| is_center_null | true                                   | false                              |
|----------------|----------------------------------------|------------------------------------|
| description    | [8^i] Compressed [元アイテムの説明]        | Compressed [元アイテムの説明]　(i)      |
| nodename       | :comp_blocks:[元アイテムの名前]_[8^i]x     | :comp_blocks:[元アイテムの名前]_i      |
@code
register_compblock("default:acacia_tree", 4, false, true)
@endcode
]]
function register_compblock(recipe, max_comp_level, is_center_null, do_decompress_flag, group)
	local recipe_def = minetest.registered_nodes[recipe]--recipeデータの取得

	if not recipe_def then
		return
	end

	local nodename = recipe:split(":")[2]--"[namespace]:[node name]"から[node name]をとりだす
	for i = 1, max_comp_level do--Cならfor(int i = 1, i < =4; ++i)
		--
		-- node登録
		--
		local def = table.copy(recipe_def)--recipeデータをコピー、書き換えていく
		for n, tile in ipairs(def.tiles) do
			def.tiles[n] = def.tiles[n].."^[colorize:black:"..i*45
		end
		def.description = register_compblock_impl_make_new_description(def.description, is_center_null, i)
		local new_nodename = register_compblock_impl_make_new_name(nodename, is_center_null, i)
		def.drop = new_nodename
		def.groups = group--comp_blocksはグループから外す
		minetest.register_node(":"..new_nodename, def)--いじり終わったらnode登録
		--
		-- Craft Recipe登録
		--
		--previousだから-1する.C++なら(1 == i) ? recipe : nodename + "_" + std::to_string(i - 1)
		local previous = 1 == i and recipe or register_compblock_impl_make_new_name(nodename, is_center_null, i - 1)
		register_compblock_impl_register_craft(previous, new_nodename, is_center_null, do_decompress_flag)
	end
end
--[[
@brief 圧縮部ロック系を登録する
@param group_name 1段階目の圧縮に使うアイテム群であるグループ名。"leaves"のように。"group:"は不要です
@param base_node 元にするブロック名。"default:acacia_tree"みたいに
@param max_comp_level 圧縮のレベル。1以上。
@param is_center_null 中央空白の8個圧縮のレシピにするか(true)否か(false)
@param do_decompress_flag trueで解凍レシピ追加、falseで追加しない
@detail


| is_center_null | true                                   | false                              |
|----------------|----------------------------------------|------------------------------------|
| description    | [8^i] Compressed [group名]        | Compressed [group名]　(i)      |
| nodename       | :comp_blocks:[group名]_[8^i]x     | :comp_blocks:[group名]_i      |
@code
register_compblock_by_group("leaves", "default:pine_needles", 4, false, true)
@endcode
]]
function register_compblock_by_group(group_name, base_node, max_comp_level, is_center_null, do_decompress_flag, group)
	if 0 == minetest.get_item_group(base_node, group_name) then
		print("comp_blocks_utility.lua: In function `register_compblock_by_group`, "..base_node.." is not related with `group:"..group_name.."`.")
		return
	end
	local recipe_def = minetest.registered_nodes[base_node]--recipeデータの取得
	if not recipe_def then
		return
	end

	for i = 1 ,4 do--Cならfor(int i = 1, i < =4; ++i)
		--
		-- node登録
		--
		local def = table.copy(recipe_def)--recipeデータをコピー、書き換えていく
		for n, tile in ipairs(def.tiles) do
			def.tiles[n] = def.tiles[n].."^[colorize:black:"..i*45
		end
		def.description = register_compblock_impl_make_new_description(group_name, is_center_null, i)
		local new_nodename = register_compblock_impl_make_new_name(group_name, is_center_null, i)
		def.drop = new_nodename
		def.groups = group--comp_blocksはグループから外す
		minetest.register_node(":"..new_nodename, def)--いじり終わったらnode登録
		--
		-- Craft Recipe登録
		--
		--previousだから-1する.C++なら(1 == i) ? "group:" + group_name : register_compblock_impl_make_new_name(group_name, is_center_null, i - 1)
		local previous = 1 == i and "group:"..group_name or register_compblock_impl_make_new_name(group_name, is_center_null, i - 1)
		register_compblock_impl_register_craft(previous, new_nodename, is_center_null, do_decompress_flag)
	end
end
