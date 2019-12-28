#prehardmode

	#zombies
		execute unless score Target Hardmode matches 1 as @e[type=minecraft:zombie,tag=!buffed] at @s run data merge entity @s {HandItems:[{id:"minecraft:iron_sword",Count:1b},{}],HandDropChances:[-327.670F,0.085F]}
		execute unless score Target Hardmode matches 1 as @e[type=minecraft:zombie,tag=!buffed] at @s run summon minecraft:zombie ^ ^ ^0.5 {Tags:["buffed"],HandItems:[{id:"minecraft:iron_sword",Count:1b},{}],HandDropChances:[-327.670F,0.085F]}
		execute unless score Target Hardmode matches 1 as @e[type=minecraft:zombie,tag=!buffed] at @s run tag @s add buffed

	#skeletons
		execute unless score Target Hardmode matches 1 as @e[type=minecraft:skeleton,tag=!buffed] at @s run enchant @s minecraft:punch 1
		execute unless score Target Hardmode matches 1 as @e[type=minecraft:skeleton,tag=!buffed] at @s run data merge entity @s {HandDropChances:[-327.670F,0.085F]}
		execute unless score Target Hardmode matches 1 as @e[type=minecraft:skeleton,tag=!buffed] at @s run tag @s add buffed


	#other
		execute unless score Target Hardmode matches 1 as @e[type=minecraft:blaze,tag=!buffed] at @s run tag @s add buffed
		execute unless score Target Hardmode matches 1 as @e[type=minecraft:spider,tag=!buffed] at @s run tag @s add buffed
		execute unless score Target Hardmode matches 1 as @e[type=minecraft:zombie_pigman,tag=!buffed] at @s run tag @s add buffed
		execute unless score Target Hardmode matches 1 as @e[type=minecraft:silverfish,tag=!buffed] at @s run tag @s add buffed
		execute unless score Target Hardmode matches 1 as @e[type=minecraft:creeper,tag=!buffed] at @s run tag @s add buffed

#hardmode

	#zombies
		execute if score Target Hardmode matches 1 as @e[type=minecraft:zombie,tag=!buffed] at @s run data merge entity @s {HandItems:[{id:"minecraft:diamond_sword",Count:1b}],HandDropChances:[-327.670F,0.085F],ArmorItems:[{id:"minecraft:iron_boots",Count:1b},{id:"minecraft:iron_leggings",Count:1b},{id:"minecraft:diamond_chestplate",Count:1b},{id:"minecraft:iron_helmet",Count:1b}],ArmorDropChances:[-327.670F,-327.670F,-327.670F,-327.670F]}
		execute if score Target Hardmode matches 1 as @e[type=minecraft:zombie,tag=!buffed] at @s run summon minecraft:zombie ^ ^ ^0.5 {Tags:["buffed"],HandItems:[{id:"minecraft:diamond_sword",Count:1b}],HandDropChances:[-327.670F,0.085F],ArmorItems:[{id:"minecraft:iron_boots",Count:1b},{id:"minecraft:iron_leggings",Count:1b},{id:"minecraft:diamond_chestplate",Count:1b},{id:"minecraft:iron_helmet",Count:1b}],ArmorDropChances:[-327.670F,-327.670F,-327.670F,-327.670F]}
		execute if score Target Hardmode matches 1 as @e[type=minecraft:zombie,tag=!buffed] at @s run summon minecraft:zombie ^ ^ ^-0.5 {Tags:["buffed"],HandItems:[{id:"minecraft:diamond_sword",Count:1b}],HandDropChances:[-327.670F,0.085F],ArmorItems:[{id:"minecraft:iron_boots",Count:1b},{id:"minecraft:iron_leggings",Count:1b},{id:"minecraft:diamond_chestplate",Count:1b},{id:"minecraft:iron_helmet",Count:1b}],ArmorDropChances:[-327.670F,-327.670F,-327.670F,-327.670F]}
		execute if score Target Hardmode matches 1 as @e[type=minecraft:zombie,tag=!buffed] at @s run summon minecraft:zombie ^0.5 ^ ^ {Tags:["buffed"],HandItems:[{id:"minecraft:diamond_sword",Count:1b}],HandDropChances:[-327.670F,0.085F],ArmorItems:[{id:"minecraft:iron_boots",Count:1b},{id:"minecraft:iron_leggings",Count:1b},{id:"minecraft:diamond_chestplate",Count:1b},{id:"minecraft:iron_helmet",Count:1b}],ArmorDropChances:[-327.670F,-327.670F,-327.670F,-327.670F]}
		execute if score Target Hardmode matches 1 as @e[type=minecraft:zombie,tag=!buffed] at @s run tag @s add buffed

	#skeletons
		execute if score Target Hardmode matches 1 as @e[type=minecraft:skeleton,tag=!buffed] at @s run enchant @s minecraft:punch 2
		execute if score Target Hardmode matches 1 as @e[type=minecraft:skeleton,tag=!buffed] at @s run enchant @s minecraft:power 3
		execute if score Target Hardmode matches 1 as @e[type=minecraft:skeleton,tag=!buffed] at @s run enchant @s minecraft:flame
		execute if score Target Hardmode matches 1 as @e[type=minecraft:skeleton,tag=!buffed] at @s run data merge entity @s {HandDropChances:[-327.670F,0.085F]}
		execute if score Target Hardmode matches 1 as @e[type=minecraft:skeleton,tag=!buffed] at @s run setblock ~ ~2 ~ air destroy
		execute if score Target Hardmode matches 1 as @e[type=minecraft:skeleton,tag=!buffed] at @s run summon minecraft:wither_skeleton ^ ^ ^0.5 {HandItems:[{id:"minecraft:stone_sword",Count:1b,tag:{Unbreakable:1b,Enchantments:[{id:"minecraft:sharpness",lvl:2s},{id:"minecraft:fire_aspect",lvl:2s}]}},{}],HandDropChances:[-327.670F,0.085F],ActiveEffects:[{Id:1,Amplifier:1,Duration:999999},{Id:11,Amplifier:1,Duration:999999}]}
		execute if score Target Hardmode matches 1 as @e[type=minecraft:skeleton,tag=!buffed] at @s run tag @s add buffed

	#creepers
		execute if score Target Hardmode matches 1 as @e[type=minecraft:creeper,tag=!buffed] at @s run data merge entity @s {Silent:1b,ExplosionRadius:15}
		execute if score Target Hardmode matches 1 as @e[type=minecraft:creeper,tag=!buffed] at @s run team join Players
		execute if score Target Hardmode matches 1 as @e[type=minecraft:creeper] at @s run effect give @s minecraft:invisibility 1 0 true
		execute if score Target Hardmode matches 1 as @e[type=minecraft:creeper,tag=!buffed] at @s run tag @s add buffed

	#blazes
		execute if score Target Hardmode matches 1 as @e[type=minecraft:blaze,tag=!buffed] at @s run effect give @s minecraft:resistance 32767 1
		execute if score Target Hardmode matches 1 as @e[type=minecraft:blaze,tag=!buffed] at @s run effect give @s minecraft:strength 32767 1
		execute if score Target Hardmode matches 1 as @e[type=minecraft:blaze,tag=!buffed] at @s run tag @s add buffed

	#spider
		execute if score Target Hardmode matches 1 as @e[type=minecraft:spider,tag=!buffed] at @s run summon minecraft:cave_spider ^ ^ ^0.5
		execute if score Target Hardmode matches 1 as @e[type=minecraft:spider,tag=!buffed] at @s run summon minecraft:cave_spider ^ ^ ^-0.5
		execute if score Target Hardmode matches 1 as @e[type=minecraft:spider,tag=!buffed] at @s run summon minecraft:cave_spider ^0.5 ^ ^
		execute if score Target Hardmode matches 1 as @e[type=minecraft:spider,tag=!buffed] at @s run summon minecraft:cave_spider ^-0.5 ^ ^
		execute if score Target Hardmode matches 1 as @e[type=minecraft:spider,tag=!buffed] at @s run summon minecraft:cave_spider ^0.5 ^ ^0.5
		execute if score Target Hardmode matches 1 as @e[type=minecraft:spider,tag=!buffed] at @s run tag @s add buffed

	#pigmen
		execute if score Target Hardmode matches 1 as @e[type=minecraft:zombie_pigman,tag=!buffed] at @s run data merge entity @s {Anger:32767}
		execute if score Target Hardmode matches 1 as @e[type=minecraft:zombie_pigman,tag=!buffed] at @s run enchant @s minecraft:sharpness
		execute if score Target Hardmode matches 1 as @e[type=minecraft:zombie_pigman,tag=!buffed] at @s run enchant @s minecraft:fire_aspect
		execute if score Target Hardmode matches 1 as @e[type=minecraft:zombie_pigman,tag=!buffed] at @s run tag @s add buffed

	#silverfish
		execute if score Target Hardmode matches 1 as @e[type=minecraft:silverfish,tag=!buffed] at @s run effect give @s minecraft:speed 32767 2
		execute if score Target Hardmode matches 1 as @e[type=minecraft:silverfish,tag=!buffed] at @s run summon minecraft:silverfish ^ ^ ^0.25 {Tags:["buffed"],ActiveEffects:[{Id:1,Amplifier:2,Duration:999999}]}
		execute if score Target Hardmode matches 1 as @e[type=minecraft:silverfish,tag=!buffed] at @s run tag @s add buffed
