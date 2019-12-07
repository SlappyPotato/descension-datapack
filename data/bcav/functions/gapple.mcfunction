execute as @a[scores={eatGApple=1..}] at @s run scoreboard players remove @s Deaths 1
execute as @a[scores={eatGApple=1..}] at @s run scoreboard players set @s eatGApple 0

execute as @a[scores={eatNApple=1..}] at @s run scoreboard players remove @s Deaths 10
execute as @a[scores={eatNApple=1..}] at @s run scoreboard players remove @s Toxicity 5
execute as @a[scores={eatNApple=1..}] at @s run scoreboard players set @s eatNApple 0