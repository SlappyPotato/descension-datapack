#thrist decreasing system------------------------------
	
	#disable if in creative mode
	scoreboard players set @a[gamemode=creative] thirst_walk 0
	scoreboard players set @a[gamemode=creative] thirst_climb 0
	scoreboard players set @a[gamemode=creative] thirst_run 0
	scoreboard players set @a[gamemode=creative] thirst_sneak 0
	scoreboard players set @a[gamemode=creative] thirst_jump 0
	
	
	#thirst decreases naturally
	execute as @a[gamemode=survival] at @s run scoreboard players add @s thirst_nat 1
	
	#prehardmode
		#0 deaths
		execute unless score Target Hardmode matches 1 as @a[scores={Deaths=0,thirst_nat=120..}] at @s run scoreboard players add @s thirst_sys_timer 1
		execute unless score Target Hardmode matches 1 as @a[scores={Deaths=0,thirst_nat=120..}] at @s run scoreboard players set @s thirst_nat 0
		
		#1-5 deaths
		execute unless score Target Hardmode matches 1 as @a[scores={Deaths=1..5,thirst_nat=60..}] at @s run scoreboard players add @s thirst_sys_timer 1
		execute unless score Target Hardmode matches 1 as @a[scores={Deaths=1..5,thirst_nat=60..}] at @s run scoreboard players set @s thirst_nat 0
		
		#6-15 deaths
		execute unless score Target Hardmode matches 1 as @a[scores={Deaths=6..15,thirst_nat=30..}] at @s run scoreboard players add @s thirst_sys_timer 1
		execute unless score Target Hardmode matches 1 as @a[scores={Deaths=6..15,thirst_nat=30..}] at @s run scoreboard players set @s thirst_nat 0
		
		#16-30 deaths
		execute unless score Target Hardmode matches 1 as @a[scores={Deaths=16..30,thirst_nat=15..}] at @s run scoreboard players add @s thirst_sys_timer 1
		execute unless score Target Hardmode matches 1 as @a[scores={Deaths=16..30,thirst_nat=15..}] at @s run scoreboard players set @s thirst_nat 0
		
		#31+ deaths
		execute unless score Target Hardmode matches 1 as @a[scores={Deaths=31..999,thirst_nat=8..}] at @s run scoreboard players add @s thirst_sys_timer 1
		execute unless score Target Hardmode matches 1 as @a[scores={Deaths=31..999,thirst_nat=8..}] at @s run scoreboard players set @s thirst_nat 0
	
	#hardmode
		#0 deaths
		execute if score Target Hardmode matches 1 as @a[scores={Deaths=0,thirst_nat=40..}] at @s run scoreboard players add @s thirst_sys_timer 1
		execute if score Target Hardmode matches 1 as @a[scores={Deaths=0,thirst_nat=40..}] at @s run scoreboard players set @s thirst_nat 0
		
		#1-5 deaths
		execute if score Target Hardmode matches 1 as @a[scores={Deaths=1..5,thirst_nat=20..}] at @s run scoreboard players add @s thirst_sys_timer 1
		execute if score Target Hardmode matches 1 as @a[scores={Deaths=1..5,thirst_nat=20..}] at @s run scoreboard players set @s thirst_nat 0
		
		#6-15 deaths
		execute if score Target Hardmode matches 1 as @a[scores={Deaths=6..15,thirst_nat=10..}] at @s run scoreboard players add @s thirst_sys_timer 1
		execute if score Target Hardmode matches 1 as @a[scores={Deaths=6..15,thirst_nat=10..}] at @s run scoreboard players set @s thirst_nat 0
		
		#16-30 deaths
		execute if score Target Hardmode matches 1 as @a[scores={Deaths=16..30,thirst_nat=5..}] at @s run scoreboard players add @s thirst_sys_timer 1
		execute if score Target Hardmode matches 1 as @a[scores={Deaths=16..30,thirst_nat=5..}] at @s run scoreboard players set @s thirst_nat 0
		
		#31+ deaths
		execute if score Target Hardmode matches 1 as @a[scores={Deaths=31..999,thirst_nat=3..}] at @s run scoreboard players add @s thirst_sys_timer 1
		execute if score Target Hardmode matches 1 as @a[scores={Deaths=31..999,thirst_nat=3..}] at @s run scoreboard players set @s thirst_nat 0


	#sneaking decreases
	execute as @a if score @s thirst_sneak matches 1000.. at @s run scoreboard players add @s thirst_sys_timer 1
	execute as @a if score @s thirst_sneak matches 1000.. at @s run scoreboard players set @s thirst_sneak 0
	
	#walking decreases
	execute as @a if score @s thirst_walk matches 600.. at @s run scoreboard players add @s thirst_sys_timer 1
	execute as @a if score @s thirst_walk matches 600.. at @s run scoreboard players set @s thirst_walk 0
	
	#jumping decreases
	execute as @a if score @s thirst_jump matches 2.. at @s run scoreboard players add @s thirst_sys_timer 1
	execute as @a if score @s thirst_jump matches 2.. at @s run scoreboard players set @s thirst_jump 0
	
	#running decreases
	execute as @a if score @s thirst_run matches 300.. at @s run scoreboard players add @s thirst_sys_timer 1
	execute as @a if score @s thirst_run matches 300.. at @s run scoreboard players set @s thirst_run 0
	
	#climbing decreases
	execute as @a if score @s thirst_climb matches 200.. at @s run scoreboard players add @s thirst_sys_timer 1
	execute as @a if score @s thirst_climb matches 200.. at @s run scoreboard players set @s thirst_climb 0
	
	
	#actually downing the thirst
	execute as @a[scores={thirst_sys_timer=20..}] at @s run scoreboard players remove @s Thirst 1
	execute as @a[scores={thirst_sys_timer=20..}] at @s run scoreboard players set @s thirst_sys_timer 0
	
#water drinking system--------------------------------------------------------
	execute as @a store success score @s holdTwater if entity @s[nbt={SelectedItem:{id:"minecraft:potion",tag:{Purified:0b}}}]
	execute as @a store success score @s holdPwater if entity @s[nbt={SelectedItem:{id:"minecraft:potion",tag:{Purified:1b}}}]
	execute as @a store success score @s holdAnt if entity @s[nbt={SelectedItem:{id:"minecraft:potion",tag:{Antidote:1b}}}]
	
	execute as @a[scores={holdTwater=1}] at @s run scoreboard players set @s tox_wat_tim 2
	execute as @a[scores={holdPwater=1}] at @s run scoreboard players set @s pur_wat_tim 2
	execute as @a[scores={holdAnt=1}] at @s run scoreboard players set @s ant_tim 2
	
	execute as @a[scores={holdTwater=0,tox_wat_tim=1..}] at @s run scoreboard players remove @s tox_wat_tim 1
	execute as @a[scores={holdPwater=0,pur_wat_tim=1..}] at @s run scoreboard players remove @s pur_wat_tim 1
	execute as @a[scores={holdAnt=0,ant_tim=1..}] at @s run scoreboard players remove @s ant_tim 1
	
	#prehardmode drinking
	execute unless score Target Hardmode matches 1 as @a[scores={drankWater=1..,tox_wat_tim=1..}] at @s run scoreboard players add @s Thirst 10
	execute unless score Target Hardmode matches 1 as @a[scores={drankWater=1..,tox_wat_tim=1..}] at @s run tellraw @s {"text":"Your body convulses for a second as you gulp the water down.","color":"dark_green"}
	execute unless score Target Hardmode matches 1 as @a[scores={drankWater=1..,tox_wat_tim=1..}] at @s run scoreboard players add @s Toxicity 5

	execute unless score Target Hardmode matches 1 as @a[scores={drankWater=1..,pur_wat_tim=1..}] at @s run scoreboard players set @s thirst_sys_timer -50
	execute unless score Target Hardmode matches 1 as @a[scores={drankWater=1..,pur_wat_tim=1..}] at @s run tellraw @s {"text":"You feel refreshed as you gulp the water down.","color":"blue"}
	execute unless score Target Hardmode matches 1 as @a[scores={drankWater=1..,pur_wat_tim=1..}] at @s run scoreboard players add @s Thirst 60
	
	#hardmode drinking
	execute if score Target Hardmode matches 1 as @a[scores={drankWater=1..,tox_wat_tim=1..}] at @s run scoreboard players add @s Thirst 5
	execute if score Target Hardmode matches 1 as @a[scores={drankWater=1..,tox_wat_tim=1..}] at @s run tellraw @s {"text":"Your body convulses for a second as you gulp the water down.","color":"dark_green"}
	execute if score Target Hardmode matches 1 as @a[scores={drankWater=1..,tox_wat_tim=1..}] at @s run scoreboard players add @s Toxicity 10
	
	execute if score Target Hardmode matches 1 as @a[scores={drankWater=1..,pur_wat_tim=1..}] at @s run scoreboard players set @s thirst_sys_timer -20
	execute if score Target Hardmode matches 1 as @a[scores={drankWater=1..,pur_wat_tim=1..}] at @s run tellraw @s {"text":"You feel refreshed as you gulp the water down.","color":"blue"}
	execute if score Target Hardmode matches 1 as @a[scores={drankWater=1..,pur_wat_tim=1..}] at @s run scoreboard players add @s Thirst 30

	execute as @a[scores={drankWater=1..,ant_tim=1..,Toxicity=1..}] at @s run tellraw @s {"text":"It tastes odd, but you feel a bit better.","color":"light_purple"}
	execute as @a[scores={drankWater=1..,ant_tim=1..,Toxicity=0}] at @s run tellraw @s {"text":"It tastes odd.","color":"light_purple"}
	execute as @a[scores={drankWater=1..,ant_tim=1..}] at @s run scoreboard players set @s Toxicity 0

	execute as @a[scores={drankWater=1..}] at @s run scoreboard players set @s drankWater 0

	
#run out of thirst
execute as @a[scores={Thirst=..0}] at @s run advancement grant @s only bcav:die_thirst
execute as @a[scores={Thirst=..0}] at @s run kill @s