execute unless score Target Hardmode matches 1 as @a[scores={eatGApple=1..}] at @s run scoreboard players remove @s Deaths 1
execute unless score Target Hardmode matches 1 as @a[scores={eatNApple=1..}] at @s run scoreboard players remove @s Deaths 10

execute if score Target Hardmode matches 1 as @a[scores={eatNApple=1..}] at @s run scoreboard players remove @s Deaths 1


execute as @a[scores={eatNApple=1..}] at @s run scoreboard players set @s eatNApple 0
execute as @a[scores={eatGApple=1..}] at @s run scoreboard players set @s eatGApple 0
