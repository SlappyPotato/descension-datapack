#making antidote
execute if score Target Hardmode matches 1 as @e[type=minecraft:item,nbt={Item:{id:"minecraft:golden_apple",Count:1b}}] at @s if block ~ ~ ~ minecraft:cauldron[level=3] if block ~ ~-1 ~ minecraft:fire if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:potion",Count:1b,tag:{Purified:1b}}},distance=..1] run tag @s add antidote

execute as @e[type=minecraft:item,tag=antidote] at @s run fill ~ ~ ~ ~ ~ ~ minecraft:cauldron[level=0] replace minecraft:cauldron[level=3]
execute as @e[type=minecraft:item,tag=antidote] at @s run data merge entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:potion",Count:1b}},distance=..1,limit=1] {Item:{id:"minecraft:potion",Count:1b,tag:{Purified:2b,Enchantments:[{id:"minecraft:unbreaking",lvl:1}],HideFlags:127,CustomPotionColor:16202740,Potion:"minecraft:antidote",Antidote:1b,display:{Name:'{"text":"Antidote Bottle","italic":"false"}',Lore:['{"text":"Looks a bit odd.","color":"gray","italic":"false"}']}}},PickupDelay:0s}
execute as @e[type=minecraft:item,tag=antidote] at @s run kill @s
