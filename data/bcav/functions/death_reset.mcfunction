#death resetting system
execute as @a[scores={death_detector=1..}] at @s run scoreboard players set @s thirst_sys_timer 0
execute as @a[scores={death_detector=1..}] at @s run scoreboard players set @s Thirst 100
execute as @a[scores={death_detector=1..}] at @s run scoreboard players set @s Toxicity 0
execute as @a[scores={death_detector=1..}] at @s run scoreboard players set @s drankWater 0
execute as @a[scores={death_detector=1..}] at @s run scoreboard players set @s thirst_nat 0
execute as @a[scores={death_detector=1..}] at @s run scoreboard players set @s thirst_sneak 0
execute as @a[scores={death_detector=1..}] at @s run scoreboard players set @s thirst_walk 0
execute as @a[scores={death_detector=1..}] at @s run scoreboard players set @s thirst_jump 0
execute as @a[scores={death_detector=1..}] at @s run scoreboard players set @s thirst_run 0
execute as @a[scores={death_detector=1..}] at @s run scoreboard players set @s thirst_climb 0
execute as @a[scores={death_detector=1..}] at @s run scoreboard players set @s tox_decr_tim 0

execute as @a[scores={death_detector=1..}] at @s run scoreboard players set @s death_detector 0

#making sure thirst stays between 0 and 100
execute as @a unless score @s Thirst matches -9999..9999 at @s run scoreboard players set @s Thirst 100

execute as @a if score @s Thirst matches ..-1 at @s run scoreboard players set @s Thirst 0
execute as @a if score @s Thirst matches 101.. at @s run scoreboard players set @s Thirst 100