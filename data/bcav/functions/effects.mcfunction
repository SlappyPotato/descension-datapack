execute as @a unless score @s Deaths matches -9999..9999 at @s run scoreboard players set @s Deaths 0

effect give @a[scores={Deaths=0},gamemode=survival] minecraft:haste 15 1 true
effect give @a[scores={Deaths=0},gamemode=survival] minecraft:strength 15 0 true
effect give @a[scores={Deaths=0},gamemode=survival] minecraft:speed 15 1 true
effect give @a[scores={Deaths=0},gamemode=survival] minecraft:jump_boost 15 1 true
effect give @a[scores={Deaths=0},gamemode=survival] minecraft:resistance 15 1 true
effect give @a[scores={Deaths=0},gamemode=survival] minecraft:luck 15 0 true

effect give @a[scores={Deaths=1..4},gamemode=survival] minecraft:haste 15 0 true
effect give @a[scores={Deaths=1..4},gamemode=survival] minecraft:speed 15 0 true
effect give @a[scores={Deaths=1..4},gamemode=survival] minecraft:jump_boost 15 0 true
effect give @a[scores={Deaths=1..4},gamemode=survival] minecraft:resistance 15 0 true

effect give @a[scores={Deaths=6..30},gamemode=survival] minecraft:mining_fatigue 15 0 true
effect give @a[scores={Deaths=6..30},gamemode=survival] minecraft:weakness 15 0 true
effect give @a[scores={Deaths=6..30},gamemode=survival] minecraft:slowness 15 0 true
effect give @a[scores={Deaths=6..30},gamemode=survival] minecraft:unluck 15 0 true

effect give @a[scores={Deaths=11..30},gamemode=survival] minecraft:hunger 30 1 true
effect give @a[scores={Deaths=11..999},gamemode=survival] minecraft:blindness 15 0 true
effect give @a[scores={Deaths=15..20},gamemode=survival] minecraft:poison 15 0 true
effect give @a[scores={Deaths=21..25},gamemode=survival] minecraft:poison 15 1 true
effect give @a[scores={Deaths=26..30},gamemode=survival] minecraft:poison 15 2 true

effect give @a[scores={Deaths=31},gamemode=survival] minecraft:hunger 30 2 true
effect give @a[scores={Deaths=31},gamemode=survival] minecraft:mining_fatigue 15 1 true
effect give @a[scores={Deaths=31},gamemode=survival] minecraft:weakness 15 1 true
effect give @a[scores={Deaths=31},gamemode=survival] minecraft:slowness 15 1 true
effect give @a[scores={Deaths=31},gamemode=survival] minecraft:unluck 15 1 true
effect give @a[scores={Deaths=31},gamemode=survival] minecraft:poison 15 3 true

effect give @a[scores={Deaths=32..99},gamemode=survival] minecraft:hunger 30 3 true
effect give @a[scores={Deaths=32..99},gamemode=survival] minecraft:mining_fatigue 15 2 true
effect give @a[scores={Deaths=32..99},gamemode=survival] minecraft:weakness 15 2 true
effect give @a[scores={Deaths=32..99},gamemode=survival] minecraft:slowness 15 2 true
effect give @a[scores={Deaths=32..99},gamemode=survival] minecraft:unluck 15 2 true
effect give @a[scores={Deaths=32..99},gamemode=survival] minecraft:poison 15 4 true

effect give @a[scores={Deaths=100..999},gamemode=survival] minecraft:hunger 30 4 true
effect give @a[scores={Deaths=100..999},gamemode=survival] minecraft:mining_fatigue 15 3 true
effect give @a[scores={Deaths=100..999},gamemode=survival] minecraft:weakness 15 5 true
effect give @a[scores={Deaths=100..999},gamemode=survival] minecraft:slowness 15 3 true
effect give @a[scores={Deaths=100..999},gamemode=survival] minecraft:unluck 15 4 true
effect give @a[scores={Deaths=100..999},gamemode=survival] minecraft:poison 15 9 true


effect give @a[scores={Deaths=1000..},gamemode=survival] minecraft:hunger 30 127 true
effect give @a[scores={Deaths=1000..},gamemode=survival] minecraft:saturation 30 127 true
effect give @a[scores={Deaths=1000..},gamemode=survival] minecraft:mining_fatigue 30 127 true
effect give @a[scores={Deaths=1000..},gamemode=survival] minecraft:weakness 30 127 true
effect give @a[scores={Deaths=1000..},gamemode=survival] minecraft:slowness 30 127 true
effect give @a[scores={Deaths=1000..},gamemode=survival] minecraft:unluck 30 127 true
effect give @a[scores={Deaths=1000..},gamemode=survival] minecraft:wither 30 127 true
effect give @a[scores={Deaths=1000..},gamemode=survival] minecraft:resistance 30 127 true
effect give @a[scores={Deaths=1000..},gamemode=survival] minecraft:regeneration 30 127 true
effect give @a[scores={Deaths=1000..},gamemode=survival] minecraft:health_boost 30 255 true
effect give @a[scores={Deaths=1000..},gamemode=survival] minecraft:absorption 30 255 true
execute as @a[scores={Deaths=1000..},gamemode=survival] at @s run tp @s @r[scores={Deaths=1000..},gamemode=survival]
execute as @a[scores={Deaths=1000..},gamemode=survival] at @s run tp @s ~ ~ ~ facing entity @e[limit=1,sort=random]
