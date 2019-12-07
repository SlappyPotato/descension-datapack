#actionbar thing
execute as @a[gamemode=survival] at @s run title @s actionbar ["",{"text":"Deaths: ","bold":true,"color":"gold"},{"score":{"name":"@s","objective":"Deaths"},"bold":true,"color":"red"},{"text":" | ","bold":true,"color":"gray"},{"text":"Thirst: ","bold":true,"color":"dark_aqua"},{"score":{"name":"@s","objective":"Thirst"},"bold":true,"color":"aqua"},{"text":"%","bold":true,"color":"aqua"},{"text":" | ","bold":true,"color":"gray"},{"text":"Toxicity: ","bold":true,"color":"dark_green"},{"score":{"name":"@s","objective":"Toxicity"},"bold":true,"color":"green"},{"text":"%","bold":true,"color":"green"}]

#makes sure deaths doesn't go negative
execute as @a[scores={Deaths=..0}] at @s run scoreboard players set @s Deaths 0

#in prehardmode, randomtickspeed default of 3
execute unless score Target Hardmode matches 1 run gamerule randomTickSpeed 3

#in hardmode, rts 1
execute if score Target Hardmode matches 1 run gamerule randomTickSpeed 1



advancement grant @a only bcav:root
execute as @a[scores={Deaths=1..}] at @s run advancement grant @s only bcav:die
execute as @a[scores={Deaths=5..}] at @s run advancement grant @s only bcav:die_five
execute as @a[scores={Deaths=6..}] at @s run advancement grant @s only bcav:die_six
execute as @a[scores={Deaths=1000..}] at @s run advancement grant @s only bcav:die_thousand