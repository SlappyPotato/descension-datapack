#time limit bar
	execute if score Target wt_count matches 1.. run bossbar set bcav:wt_time visible true
	execute if score Target wt_count matches 0 run bossbar set bcav:wt_time visible false

#wither can break anything
	execute as @e[type=minecraft:wither] at @s run fill ~2 ~2 ~2 ~-2 ~ ~-2 air destroy

#wither time limit and other things

	#right at spawn time
		#execute if score Target wt_count matches ..1 as @e[type=minecraft:wither,tag=!wt_lim,tag=!wt_init] at @s run bossbar set bcav:wt_time visible true
		execute if score Target wt_count matches ..1 as @e[type=minecraft:wither,tag=!wt_lim,tag=!wt_init] at @s run summon minecraft:armor_stand ~ ~ ~ {CustomName:'{"text":"WT_TRCK_STN"}',Invulnerable:1b,Marker:1b,Invisible:1b,NoGravity:1b,Tags:["WT_TRCK_STN"]}
		execute if score Target wt_count matches ..1 as @e[type=minecraft:wither,tag=!wt_lim,tag=!wt_init] at @s run tellraw @a[distance=..500] {"text":"Your heart skips a beat...","color":"dark_purple","bold":"true"}
		execute if score Target wt_count matches ..1 as @e[type=minecraft:wither,tag=!wt_lim,tag=!wt_init] at @s run effect give @s minecraft:glowing 32767 0 true
		execute if score Target wt_count matches ..1 as @e[type=minecraft:wither,tag=!wt_lim,tag=!wt_init] at @s run data merge entity @s {CustomName:'[{"text":"[","color":"dark_purple","bold":"true"},{"text":"Void Demon","bold":"true","color":"light_purple"},{"text":"]","color":"dark_purple","bold":"true"}]'}
		execute if score Target wt_count matches ..1 as @e[type=minecraft:wither,tag=!wt_lim,tag=!wt_init] at @s run team join wither_team @s
		execute if score Target wt_count matches ..1 as @e[type=minecraft:wither,tag=!wt_lim,tag=!wt_init] at @s run tag @s add wt_init

	#summons minions as it gets out of invuln
		execute as @e[type=minecraft:wither,tag=!wt_lim,scores={wt_time=230..235}] at @s run summon minecraft:wither_skeleton ~ ~ ~ {CustomNameVisible:1b,DeathLootTable:"minecraft:empty",PersistenceRequired:1b,CustomName:'{"text":"Void Lurker","color":"dark_gray","bold":true}',HandItems:[{id:"minecraft:stone_sword",Count:1b,tag:{Unbreakable:1b,Enchantments:[{id:"minecraft:sharpness",lvl:2s},{id:"minecraft:fire_aspect",lvl:2s}]}},{}],HandDropChances:[-327.670F,0.085F],ActiveEffects:[{Id:1,Amplifier:1,Duration:999999},{Id:11,Amplifier:1,Duration:999999},{Id:24,Duration:999999}],Tags:["wt_minion"]}
		execute as @e[type=minecraft:wither,tag=!wt_lim,scores={wt_time=230..235}] at @s run summon minecraft:wither_skeleton ~ ~ ~ {CustomNameVisible:1b,DeathLootTable:"minecraft:empty",PersistenceRequired:1b,CustomName:'{"text":"Void Lurker","color":"dark_gray","bold":true}',HandItems:[{id:"minecraft:stone_sword",Count:1b,tag:{Unbreakable:1b,Enchantments:[{id:"minecraft:sharpness",lvl:2s},{id:"minecraft:fire_aspect",lvl:2s}]}},{id:"minecraft:bow",Count:1b,tag:{RepairCost:999,Unbreakable:1b,Enchantments:[{id:"minecraft:punch",lvl:2s}]}}],HandDropChances:[-327.670F,-327.670F],ActiveEffects:[{Id:1,Amplifier:1,Duration:999999},{Id:11,Amplifier:1,Duration:999999},{Id:24,Duration:999999}],Tags:["wt_minion"]}
		execute as @e[type=minecraft:wither,tag=!wt_lim,scores={wt_time=230..240}] at @s run team join wither_team @e[type=minecraft:wither_skeleton,tag=wt_minion]
		execute as @e[type=minecraft:wither,tag=!wt_lim,tag=!wt_mult] at @s run bossbar set bcav:wt_time players @a[distance=..100]
		execute as @e[type=minecraft:wither,tag=!wt_lim] at @s store result bossbar bcav:wt_time value run scoreboard players add @s wt_time 1
		execute as @e[type=minecraft:wither,tag=!wt_lim,scores={wt_time=24000..}] at @s run tag @s add wt_lim

	#wither constantly destroys silverfish around it
		execute as @e[type=minecraft:wither,tag=!wt_lim] at @s run tp @e[type=minecraft:silverfish,distance=..50] ~ ~-1000 ~

	#time is up
		execute as @e[type=minecraft:wither,tag=wt_lim] at @s run kill @e[type=minecraft:armor_stand,tag=WT_TRCK_STN]
		#execute as @e[type=minecraft:wither,tag=wt_lim] at @s run bossbar set bcav:wt_time visible false
		execute as @e[type=minecraft:wither,tag=wt_lim] at @s run tellraw @a[distance=..500] {"text":"The evil fades.","color":"light_purple","bold":"true"}
		execute as @e[type=minecraft:wither,tag=wt_lim] at @s run execute as @a at @s run playsound minecraft:entity.wither.spawn hostile @s ~ ~ ~ 1 1.5
		execute as @e[type=minecraft:wither,tag=wt_lim] at @s run particle minecraft:flash ~ ~ ~ 1 1 1 0 100
		execute as @e[type=minecraft:wither,tag=wt_lim] at @s run summon minecraft:item ~ ~ ~ {PickupDelay:0s,Age:-32768,NoGravity:1b,Glowing:1b,Item:{id:"minecraft:wither_skeleton_skull",Count:2b}}
		execute if entity @e[type=minecraft:wither,tag=wt_lim] as @e[type=minecraft:wither_skeleton,tag=wt_minion] at @s run particle minecraft:flash ~ ~ ~ 0 0 0 0 20
		execute if entity @e[type=minecraft:wither,tag=wt_lim] as @e[type=minecraft:wither_skeleton,tag=wt_minion] at @s run tp @s ~ ~-1000 ~
		execute if entity @e[type=minecraft:wither,tag=wt_lim] as @e[type=minecraft:wither_skeleton,tag=wt_minion] at @s run kill @s
		execute as @e[type=minecraft:wither,tag=wt_lim] at @s run tp @s ~ ~-1000 ~
		execute as @e[type=minecraft:wither,tag=wt_lim] at @s run kill @s

	#prevent multiple withers
		execute store result score Target wt_count if entity @e[type=wither]
		execute if score Target wt_count matches 2.. as @e[type=minecraft:wither] if score @s wt_time < @e[type=minecraft:wither,distance=0.5..,sort=furthest,limit=1] wt_time at @s run kill @e[type=minecraft:armor_stand,tag=WT_TRCK_STN,sort=nearest,limit=1,distance=..5]
		execute if score Target wt_count matches 2.. as @e[type=minecraft:wither] if score @s wt_time < @e[type=minecraft:wither,distance=0.5..,sort=furthest,limit=1] wt_time at @s run tag @s add wt_mult
		execute if score Target wt_count matches 2.. as @e[type=minecraft:wither] if score @s wt_time < @e[type=minecraft:wither,distance=0.5..,sort=furthest,limit=1] wt_time at @s run particle minecraft:flash ~ ~ ~ 0 0 0 0 20
		execute if score Target wt_count matches 2.. as @e[type=minecraft:wither] if score @s wt_time < @e[type=minecraft:wither,distance=0.5..,sort=furthest,limit=1] wt_time at @s run summon minecraft:item ~ ~ ~ {PickupDelay:0s,Age:-32768,NoGravity:1b,Glowing:1b,Item:{id:"minecraft:wither_skeleton_skull",Count:2b}}
		execute if score Target wt_count matches 2.. as @e[type=minecraft:wither] if score @s wt_time < @e[type=minecraft:wither,distance=0.5..,sort=furthest,limit=1] wt_time at @s run tp @s ~ ~-1000 ~
		execute if score Target wt_count matches 2.. as @e[type=minecraft:wither] if score @s wt_time < @e[type=minecraft:wither,distance=0.5..,sort=furthest,limit=1] wt_time at @s run kill @s

	execute as @e[type=minecraft:armor_stand,tag=WT_TRCK_STN] at @s run tp @s @e[type=minecraft:wither,sort=nearest,limit=1]
	execute as @e[type=minecraft:armor_stand,tag=WT_TRCK_STN] at @s store success score @s found_wt if entity @e[type=minecraft:wither]

	#kill wither
		execute as @a[scores={killed_wt=1..}] at @s run scoreboard players set Target wt_killed 1
		execute as @a[scores={killed_wt=1..}] at @s run scoreboard players set @s killed_wt 0

		execute as @e[type=minecraft:armor_stand,tag=WT_TRCK_STN,scores={found_wt=0}] at @s run scoreboard players set Target wt_killed 1

	#wither killed
		execute if score Target wt_killed matches 1 unless score Target first_wt_killed matches 1 run scoreboard players set Target Hardmode 1
		execute if score Target wt_killed matches 1 unless score Target first_wt_killed matches 1 run title @a subtitle {"text":"Cower in fear.","color":"red"}
		execute if score Target wt_killed matches 1 unless score Target first_wt_killed matches 1 run title @a title {"text":"Hardmode begins.","color":"gold","bold":true}
		execute if score Target wt_killed matches 1 unless score Target first_wt_killed matches 1 run effect give @a minecraft:resistance 4 127 true
		execute if score Target wt_killed matches 1 unless score Target first_wt_killed matches 1 run effect give @a minecraft:saturation 5 127 true
		execute if score Target wt_killed matches 1 unless score Target first_wt_killed matches 1 run effect give @a minecraft:instant_health 5 127 true

		execute if score Target wt_killed matches 1 unless score Target first_wt_killed matches 1 run advancement grant @a only bcav:hardmode
		execute if score Target wt_killed matches 1 unless score Target first_wt_killed matches 1 run tellraw @a {"text":"The ancient spirits of evil have been released.","color":"light_purple"}
		execute if score Target wt_killed matches 1 unless score Target first_wt_killed matches 1 as @e[type=minecraft:armor_stand,tag=WT_TRCK_STN,scores={found_wt=0}] at @s run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:1b,Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'{"text":"WT_N"}',Tags:["fst_wtk_stn","wt_north"]}
		execute if score Target wt_killed matches 1 unless score Target first_wt_killed matches 1 as @e[type=minecraft:armor_stand,tag=WT_TRCK_STN,scores={found_wt=0}] at @s run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:1b,Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'{"text":"WT_E"}',Tags:["fst_wtk_stn","wt_east"]}
		execute if score Target wt_killed matches 1 unless score Target first_wt_killed matches 1 as @e[type=minecraft:armor_stand,tag=WT_TRCK_STN,scores={found_wt=0}] at @s run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:1b,Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'{"text":"WT_S"}',Tags:["fst_wtk_stn","wt_south"]}
		execute if score Target wt_killed matches 1 unless score Target first_wt_killed matches 1 as @e[type=minecraft:armor_stand,tag=WT_TRCK_STN,scores={found_wt=0}] at @s run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:1b,Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'{"text":"WT_W"}',Tags:["fst_wtk_stn","wt_west"]}
		execute if score Target wt_killed matches 1 unless score Target first_wt_killed matches 1 as @e[type=minecraft:armor_stand,tag=WT_TRCK_STN,scores={found_wt=0}] at @s run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:1b,Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'{"text":"WT"}',Tags:["fst_wtk_stn","wt_stationary"]}
		execute if score Target wt_killed matches 1 unless score Target first_wt_killed matches 1 as @e[type=minecraft:armor_stand,tag=WT_TRCK_STN,scores={found_wt=0}] at @s run scoreboard players set @e[type=minecraft:armor_stand,tag=fst_wtk_stn] stand_tim 0
		execute if score Target wt_killed matches 1 unless score Target first_wt_killed matches 1 as @e[type=minecraft:armor_stand,tag=WT_TRCK_STN,scores={found_wt=0}] at @s run particle minecraft:explosion_emitter ~ ~ ~ 1 1 1 0 100
		execute if score Target wt_killed matches 1 unless score Target first_wt_killed matches 1 as @e[type=minecraft:armor_stand,tag=WT_TRCK_STN,scores={found_wt=0}] at @s run playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 0.1
		execute if score Target wt_killed matches 1 run scoreboard players set Target first_wt_killed 1
		#execute if score Target wt_killed matches 1 run bossbar set bcav:wt_time visible false
		execute if score Target wt_killed matches 1 run kill @e[type=minecraft:wither_skeleton,tag=wt_minion]
		execute as @e[type=minecraft:armor_stand,tag=WT_TRCK_STN,scores={found_wt=0}] at @s run kill @s
		execute if score Target wt_killed matches 1 run scoreboard players set Target wt_killed 0

	#first witherkill stands
		execute as @e[type=minecraft:armor_stand,tag=wt_north,scores={stand_tim=..50}] at @s run tp @s ~ ~ ~-5
		execute as @e[type=minecraft:armor_stand,tag=wt_north,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:magma_block replace minecraft:gravel
		execute as @e[type=minecraft:armor_stand,tag=wt_north,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:netherrack replace minecraft:stone
		execute as @e[type=minecraft:armor_stand,tag=wt_north,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:netherrack replace minecraft:infested_stone
		execute as @e[type=minecraft:armor_stand,tag=wt_north,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:soul_sand replace minecraft:dirt
		execute as @e[type=minecraft:armor_stand,tag=wt_north,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:barrier replace minecraft:water
		execute as @e[type=minecraft:armor_stand,tag=wt_north,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:lava replace minecraft:barrier
		execute as @e[type=minecraft:armor_stand,tag=wt_north,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:magma_block replace minecraft:cobblestone
		execute as @e[type=minecraft:armor_stand,tag=wt_north,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:magma_block replace minecraft:infested_cobblestone
		execute as @e[type=minecraft:armor_stand,tag=wt_north,scores={stand_tim=..50}] at @s run scoreboard players add @s stand_tim 1

		execute as @e[type=minecraft:armor_stand,tag=wt_east,scores={stand_tim=..50}] at @s run tp @s ~5 ~ ~
		execute as @e[type=minecraft:armor_stand,tag=wt_east,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:obsidian replace minecraft:gravel
		execute as @e[type=minecraft:armor_stand,tag=wt_east,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:end_stone replace minecraft:stone
		execute as @e[type=minecraft:armor_stand,tag=wt_east,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:end_stone replace minecraft:infested_stone
		execute as @e[type=minecraft:armor_stand,tag=wt_east,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:end_stone replace minecraft:dirt
		execute as @e[type=minecraft:armor_stand,tag=wt_east,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:obsidian replace minecraft:cobblestone
		execute as @e[type=minecraft:armor_stand,tag=wt_east,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:obsidian replace minecraft:infested_cobblestone
		execute as @e[type=minecraft:armor_stand,tag=wt_east,scores={stand_tim=..50}] at @s run scoreboard players add @s stand_tim 1

		execute as @e[type=minecraft:armor_stand,tag=wt_south,scores={stand_tim=..50}] at @s run tp @s ~ ~ ~5
		execute as @e[type=minecraft:armor_stand,tag=wt_south,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:magma_block replace minecraft:gravel
		execute as @e[type=minecraft:armor_stand,tag=wt_south,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:netherrack replace minecraft:stone
		execute as @e[type=minecraft:armor_stand,tag=wt_south,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:netherrack replace minecraft:infested_stone
		execute as @e[type=minecraft:armor_stand,tag=wt_south,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:soul_sand replace minecraft:dirt
		execute as @e[type=minecraft:armor_stand,tag=wt_south,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:barrier replace minecraft:water
		execute as @e[type=minecraft:armor_stand,tag=wt_south,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:lava replace minecraft:barrier
		execute as @e[type=minecraft:armor_stand,tag=wt_south,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:magma_block replace minecraft:cobblestone
		execute as @e[type=minecraft:armor_stand,tag=wt_south,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:magma_block replace minecraft:infested_cobblestone
		execute as @e[type=minecraft:armor_stand,tag=wt_south,scores={stand_tim=..50}] at @s run scoreboard players add @s stand_tim 1

		execute as @e[type=minecraft:armor_stand,tag=wt_west,scores={stand_tim=..50}] at @s run tp @s ~-5 ~ ~
		execute as @e[type=minecraft:armor_stand,tag=wt_west,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:obsidian replace minecraft:gravel
		execute as @e[type=minecraft:armor_stand,tag=wt_west,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:end_stone replace minecraft:stone
		execute as @e[type=minecraft:armor_stand,tag=wt_west,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:end_stone replace minecraft:infested_stone
		execute as @e[type=minecraft:armor_stand,tag=wt_west,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:end_stone replace minecraft:dirt
		execute as @e[type=minecraft:armor_stand,tag=wt_west,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:obsidian replace minecraft:cobblestone
		execute as @e[type=minecraft:armor_stand,tag=wt_west,scores={stand_tim=1..50}] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:obsidian replace minecraft:infested_cobblestone
		execute as @e[type=minecraft:armor_stand,tag=wt_west,scores={stand_tim=..50}] at @s run scoreboard players add @s stand_tim 1

		execute as @e[type=minecraft:armor_stand,tag=wt_stationary] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:bedrock replace minecraft:gravel
		execute as @e[type=minecraft:armor_stand,tag=wt_stationary] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:bedrock replace minecraft:stone
		execute as @e[type=minecraft:armor_stand,tag=wt_stationary] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:bedrock replace minecraft:infested_stone
		execute as @e[type=minecraft:armor_stand,tag=wt_stationary] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:bedrock replace minecraft:dirt
		execute as @e[type=minecraft:armor_stand,tag=wt_stationary] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:bedrock replace minecraft:cobblestone
		execute as @e[type=minecraft:armor_stand,tag=wt_stationary] at @s run fill ~5 255 ~5 ~-5 0 ~-5 minecraft:bedrock replace minecraft:infested_cobblestone
		execute as @e[type=minecraft:armor_stand,tag=wt_stationary] at @s run kill @s

		execute as @e[type=minecraft:armor_stand,tag=fst_wtk_stn,scores={stand_tim=51..}] at @s run kill @s
