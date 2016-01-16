# woodtodirt Mod for Mine Test 0.4.13

## Introduction
This mod add few compressed block and few tools and few item to make dirt.
Main resorces to make dirt is "leaves".

## How to install
Unzip the archive an place it in ``minetest-base-directory/mods/minetest/``
if you have a windows client or a linux run-in-place client. If you have
a linux system-wide instalation place it in ``~/.minetest/mods/minetest/.``
If you want to install this mod only in one world create the folder
``worldmods/`` in your worlddirectory.
For further information or help see:
http://wiki.minetest.com/wiki/Installing_Mods

## How to use the mod
Just install it an everything works.

## Dependent Mods
none.

## Recommended Mods

### Cooporating Mods
- [charcoal](https://forum.minetest.net/viewtopic.php?f=11&t=3971)
- [More Blocks](https://forum.minetest.net/viewtopic.php?t=509)

### for crafting convenient
- [Craft Guide](https://forum.minetest.net/viewtopic.php?t=2334)
- [Unified Inventory](https://forum.minetest.net/viewtopic.php?t=3933)

## Minimal Craft Recipe

if you want to know everthing, watch ``init.lua`` or Use Craft Guide.

```
Stick -> splitted stick x 4

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
```

## License
|                         | License name                              | License Documents                              |
|-------------------------|-------------------------------------------|------------------------------------------------|
| init.lua                | MIT License                               | http://opensource.org/licenses/mit-license.php |
| comp_blocks_utility.lua | Boost Software License, Version 1.0       | http://www.boost.org/LICENSE_1_0.txt           |
| Textures                | Attribution 4.0 International (CC BY 4.0) | https://creativecommons.org/licenses/by/4.0/   |
