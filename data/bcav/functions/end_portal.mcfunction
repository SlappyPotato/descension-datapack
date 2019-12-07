#making end portal
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] at @s if block ~ ~-1 ~ minecraft:end_stone if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:ender_eye",Count:1b}},distance=..1] unless entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:blaze_powder",Count:1b}},distance=..2] unless score Target EPORT_BUILT matches 1 run tag @s add eport_item

execute as @e[type=minecraft:item,tag=eport_item] at @s align xyz run summon minecraft:armor_stand ~0.5 ~-1 ~0.5 {CustomName:'{"text":"END_PORT_STND"}',Tags:["end_portal"],Invisible:1b,Invulnerable:1b,Marker:1b,NoGravity:1b,ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"36122cdc-6c97-4b97-990a-ef4df57db922",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZGFhOGZjOGRlNjQxN2I0OGQ0OGM4MGI0NDNjZjUzMjZlM2Q5ZGE0ZGJlOWIyNWZjZDQ5NTQ5ZDk2MTY4ZmMwIn19fQ=="}]}}}}],ActiveEffects:[{Id:24,Duration:999999},{Id:11b,Amplifier:1b,Duration:999999}]}
execute as @e[type=minecraft:item,tag=eport_item] at @s run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:ender_eye",Count:1b}},distance=..2]
execute as @e[type=minecraft:item,tag=eport_item] at @s run kill @s

#rotating
execute as @e[type=minecraft:armor_stand,tag=end_portal] at @s run scoreboard players add @s end_portal 1
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1..60}] at @s run tp @s ~ ~ ~ ~5 ~
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=61..120}] at @s run tp @s ~ ~ ~ ~10 ~
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=121..180}] at @s run tp @s ~ ~ ~ ~20 ~
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=181..240}] at @s run tp @s ~ ~ ~ ~30 ~
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=241..300}] at @s run tp @s ~ ~ ~ ~40 ~
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=301..}] at @s run tp @s ~ ~ ~ ~59 ~

#does not allow players
execute positioned as @e[type=minecraft:armor_stand,tag=end_portal] as @a[distance=..6.25,gamemode=survival] at @s run tp @s ^ ^ ^-0.5 facing entity @e[type=minecraft:armor_stand,tag=end_portal,sort=nearest,limit=1]

#ACTUAL PORTAL SUMMONING --------------------------------

#removes endstone
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1..2}] at @s run setblock ~ ~1 ~ end_rod[facing=down]

#clears out area
execute if entity @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=61..789}] run function bcav:eport_clear
execute if entity @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=61..789}] run function bcav:eport_cl_part

#endstone box
execute if entity @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=790..1175}] run function bcav:eport_box

#adds doorway holes
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1176}] at @s run fill ~4 ~3 ~1 ~4 ~ ~-1 air destroy
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1177}] at @s run fill ~1 ~3 ~4 ~-1 ~ ~4 air destroy
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1178}] at @s run fill ~-4 ~3 ~1 ~-4 ~ ~-1 air destroy
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1179}] at @s run fill ~1 ~3 ~-4 ~-1 ~ ~-4 air destroy

#decoration
execute if entity @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1180..1237}] run function bcav:eport_cosm

#sets floor to lava
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1238}] at @s run fill ~3 ~-3 ~3 ~-3 ~-3 ~-3 minecraft:lava



#adds portal
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1239}] at @s run setblock ~2 ~-1 ~ minecraft:end_portal_frame[facing=west]
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1240}] at @s run setblock ~2 ~-1 ~1 minecraft:end_portal_frame[facing=west]
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1241}] at @s run setblock ~2 ~-1 ~-1 minecraft:end_portal_frame[facing=west]
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1242}] at @s run setblock ~-2 ~-1 ~ minecraft:end_portal_frame[facing=east]
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1243}] at @s run setblock ~-2 ~-1 ~1 minecraft:end_portal_frame[facing=east]
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1244}] at @s run setblock ~-2 ~-1 ~-1 minecraft:end_portal_frame[facing=east]
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1245}] at @s run setblock ~ ~-1 ~2 minecraft:end_portal_frame[facing=north]
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1246}] at @s run setblock ~1 ~-1 ~2 minecraft:end_portal_frame[facing=north]
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1247}] at @s run setblock ~-1 ~-1 ~2 minecraft:end_portal_frame[facing=north]
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1248}] at @s run setblock ~ ~-1 ~-2 minecraft:end_portal_frame[facing=south]
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1249}] at @s run setblock ~1 ~-1 ~-2 minecraft:end_portal_frame[facing=south]
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1250}] at @s run setblock ~-1 ~-1 ~-2 minecraft:end_portal_frame[facing=south]

#remove self
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1251}] at @s run advancement grant @a only bcav:make_eport
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1251}] at @s run particle minecraft:flash ~ ~ ~ 0 0 0 0 1 normal
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1251}] at @s run fill ~ ~1 ~ ~ ~-1 ~ air
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1251}] at @s run scoreboard players set Target EPORT_BUILT 1
execute as @e[type=minecraft:armor_stand,tag=end_portal,scores={end_portal=1252}] at @s run kill @s