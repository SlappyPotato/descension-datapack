#going into water rapidly increases tox
execute as @e[type=minecraft:player,gamemode=survival] unless entity @s[nbt={ActiveEffects:[{Id:13b}]}] at @s if block ~ ~ ~ minecraft:water run scoreboard players add @s Toxicity 8
execute as @e[type=minecraft:player,gamemode=survival] unless entity @s[nbt={ActiveEffects:[{Id:13b}]}] at @s if block ~ ~1 ~ minecraft:water run scoreboard players add @s Toxicity 8

#water breathing counteracts toxicity in water
execute as @e[type=minecraft:player,gamemode=survival] if entity @s[nbt={ActiveEffects:[{Id:13b}]}] at @s if block ~ ~ ~ minecraft:water run scoreboard players add @s wbrth_toxinc 1
execute as @e[type=minecraft:player,gamemode=survival] if entity @s[nbt={ActiveEffects:[{Id:13b}]}] at @s if block ~ ~1 ~ minecraft:water run scoreboard players add @s wbrth_toxinc 1
execute as @a[scores={wbrth_toxinc=60..}] at @s run scoreboard players add @s Toxicity 1
execute as @a[scores={wbrth_toxinc=60..}] at @s run scoreboard players set @s wbrth_toxinc 0

#makes sure toxicity stays in bounds
execute as @a unless score @s Toxicity matches -9999..9999 at @s run scoreboard players set @s Toxicity 0
execute as @a if score @s Toxicity matches ..-1 at @s run scoreboard players set @s Toxicity 0
execute as @a if score @s Toxicity matches 101.. at @s run scoreboard players set @s Toxicity 100

#naturally decrease toxicity very slowly in prehardmode
execute unless score Target Hardmode matches 1 as @a[scores={Toxicity=1..,Thirst=50..}] at @s run scoreboard players add @s tox_decr_tim 1
execute unless score Target Hardmode matches 1 as @a[scores={tox_decr_tim=6000..}] at @s run scoreboard players remove @s Toxicity 1
execute unless score Target Hardmode matches 1 as @a[scores={tox_decr_tim=6000..}] at @s run scoreboard players set @s tox_decr_tim 0


#30 tox slow
execute as @a if score @s Toxicity matches 30..99 at @s run effect give @s minecraft:slowness 5 0 true

#50 tox hunger
execute as @a if score @s Toxicity matches 50..99 at @s run effect give @s minecraft:hunger 5 1 true

#70 tox poison
execute as @a if score @s Toxicity matches 70..99 at @s run effect give @s minecraft:poison 5 0 true

#90 tox blind
execute as @a if score @s Toxicity matches 90..99 at @s run effect give @s minecraft:blindness 5 0 true

#100 tox kills
execute as @a if score @s Toxicity matches 100.. at @s run advancement grant @s only bcav:die_tox
execute as @a if score @s Toxicity matches 100.. at @s run kill @s