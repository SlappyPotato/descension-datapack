#death and death reset objs
	scoreboard objectives add Deaths deathCount
	scoreboard objectives add death_detector deathCount

#gapple objs
	scoreboard objectives add eatGApple minecraft.used:minecraft.golden_apple
	scoreboard objectives add eatNApple minecraft.used:minecraft.enchanted_golden_apple

#thirst, drinking, toxicity, etc. objs
	scoreboard objectives add drankWater minecraft.used:minecraft.potion
	scoreboard objectives add Thirst dummy
	scoreboard objectives add thirst_sys_timer dummy
	scoreboard objectives add Toxicity dummy
	scoreboard objectives add holdTwater dummy
	scoreboard objectives add holdPwater dummy
	scoreboard objectives add holdAnt dummy
	scoreboard objectives add tox_wat_tim dummy
	scoreboard objectives add pur_wat_tim dummy
	scoreboard objectives add ant_tim dummy
	scoreboard objectives add tox_decr_tim dummy
	scoreboard objectives add wbrth_toxinc dummy

#thirst decreasing objs
	scoreboard objectives add thirst_nat dummy
	scoreboard objectives add thirst_walk minecraft.custom:minecraft.walk_one_cm
	scoreboard objectives add thirst_climb minecraft.custom:minecraft.climb_one_cm
	scoreboard objectives add thirst_run minecraft.custom:minecraft.sprint_one_cm
	scoreboard objectives add thirst_sneak minecraft.custom:minecraft.crouch_one_cm
	scoreboard objectives add thirst_jump minecraft.custom:minecraft.jump

#wither fight
	#wither fight and hardmode objs
	scoreboard objectives add wt_time dummy
	scoreboard objectives add Hardmode dummy
	scoreboard objectives add wt_count dummy
	scoreboard objectives add killed_wt minecraft.killed:minecraft.wither 
	scoreboard objectives add wt_killed dummy
	scoreboard objectives add first_wt_killed dummy
	scoreboard objectives add found_wt dummy
	scoreboard objectives add stand_tim dummy

	#wither team
	team add wither_team
	team modify wither_team friendlyFire false
	team modify wither_team color dark_purple

	#wither fight time limit bossbar
	bossbar add bcav:wt_time {"text":"Boss Fight Time Limit","color":"red"}
	bossbar set bcav:wt_time max 24000
	execute unless entity @e[type=minecraft:wither] run bossbar set bcav:wt_time visible false
	bossbar set bcav:wt_time style notched_10
	bossbar set bcav:wt_time color red


#making end portal objs
	scoreboard objectives add end_portal dummy
	scoreboard objectives add EPORT_BUILT dummy


#initializing new players objs
	team add Players