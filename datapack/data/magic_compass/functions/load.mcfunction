scoreboard objectives add load_timer dummy
execute unless score $first_load load_timer matches 20 run scoreboard players add $first_load load_timer 1

execute if score $first_load load_timer matches 20 if score $loaded magcomp_load matches 0 run tag @r add dumdum
execute if score $first_load load_timer matches 20 if score $loaded magcomp_load matches 0 run execute in minecraft:the_end run tp @a[tag=dumdum] 613 234 873
execute if score $first_load load_timer matches 20 if score $loaded magcomp_load matches 0 as @a[tag=dumdum] at @s run forceload add ~ ~
execute if score $first_load load_timer matches 20 if score $loaded magcomp_load matches 0 in the_end run setblock 613 233 873 end_portal
execute if score $first_load load_timer matches 20 run gamemode survival @a[tag=dumdum]
execute if score $first_load load_timer matches 20 run tag @a[tag=dumdum] remove dumdum

scoreboard objectives add tp_timer dummy

# One Time Portal Placement
execute if score $first_load load_timer matches 20 run scoreboard players set $loaded magcomp_load 1
