#making powder
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:sugar",Count:32b}}] at @s if block ~ ~ ~ minecraft:cauldron[level=0] if block ~ ~-1 ~ minecraft:fire if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:bone_meal",Count:32b}},distance=..1] run tag @s add powder

execute as @e[type=minecraft:item,tag=powder] at @s run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:bone_meal",Count:32b}},distance=..1,limit=1]
execute as @e[type=minecraft:item,tag=powder] at @s run data merge entity @s {PickupDelay:0s,Item:{Count:64b,tag:{display:{Name:'{"text":"Pest Control Powder","color":"dark_gray","bold":true,"italic":false}',Lore:['[{"text":"Drop","color":"dark_aqua","bold":"true","italic":"false"},{"text":" to use.","color":"gray","italic":"false"}]','{"text":"Removes dormant silverfish from their blocks.","color":"gray","italic":"false"}','{"text":"Has no effect on live/active silverfish.","color":"red","italic":"false"}']},Powder:1b,Enchantments:[{id:"minecraft:unbreaking",lvl:1}],HideFlags:127}}}


#usage
execute as @e[type=minecraft:item,nbt={Age:10s,Item:{id:"minecraft:sugar",Count:1b,tag:{Powder:1b}}}] unless entity @s[tag=powder] at @s run tag @s add powder_activated

execute as @e[type=minecraft:item,tag=powder_activated] at @s run data merge entity @s {PickupDelay:32767s}
execute as @e[type=minecraft:item,tag=powder_activated] at @s run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 minecraft:stone replace minecraft:infested_stone
execute as @e[type=minecraft:item,tag=powder_activated] at @s run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 minecraft:cobblestone replace minecraft:infested_cobblestone
execute as @e[type=minecraft:item,tag=powder_activated] at @s run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 minecraft:stone_bricks replace minecraft:infested_stone_bricks
execute as @e[type=minecraft:item,tag=powder_activated] at @s run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 minecraft:mossy_stone_bricks replace minecraft:infested_mossy_stone_bricks
execute as @e[type=minecraft:item,tag=powder_activated] at @s run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 minecraft:cracked_stone_bricks replace minecraft:infested_cracked_stone_bricks
execute as @e[type=minecraft:item,tag=powder_activated] at @s run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 minecraft:chiseled_stone_bricks replace minecraft:infested_chiseled_stone_bricks
execute as @e[type=minecraft:item,tag=powder_activated] at @s run particle minecraft:happy_villager ~ ~ ~ 1.5 1.5 1.5 0 50 normal
execute as @e[type=minecraft:item,tag=powder_activated] at @s run playsound minecraft:entity.experience_orb.pickup master @p ~ ~ ~ 1 0.5
execute as @e[type=minecraft:item,tag=powder_activated] at @s run kill @s