# One-time installation
scoreboard objectives add magcomp_load dummy
scoreboard players add $loaded magcomp_load 0

# Increment the timer
execute as @a[nbt={SelectedItem:{tag:{isMagicCompass:1}}}] run scoreboard players add @s tp_timer 1

# Display the message
execute as @a[scores={tp_timer=20}] at @s run title @s title "Magic Compass"
execute as @a[scores={tp_timer=20}] at @s run title @s subtitle ["",{"text":"Whisking ye away in 5...","color":"dark_aqua"}]
execute as @a[scores={tp_timer=40}] at @s run title @s subtitle ["",{"text":"Whisking ye away in 4...","color":"dark_aqua"}]
execute as @a[scores={tp_timer=60}] at @s run title @s subtitle ["",{"text":"Whisking ye away in 3...","color":"dark_aqua"}]
execute as @a[scores={tp_timer=80}] at @s run title @s subtitle ["",{"text":"Whisking ye away in 2...","color":"dark_aqua"}]
execute as @a[scores={tp_timer=100}] at @s run title @s subtitle ["",{"text":"Whisking ye away in 1...","color":"dark_aqua"}]
execute as @a[scores={tp_timer=120}] at @s run title @s subtitle ["",{"text":"Whisking ye away now...","color":"dark_aqua"}]

# Play the sound
execute as @a[scores={tp_timer=0}] at @s run playsound minecraft:block.portal.trigger master @a[distance=..20] ~ ~ ~ 0.5 0 0.2

# Particle effects
execute as @a[scores={tp_timer=10..}] at @s run particle minecraft:end_rod ~ ~ ~ .3 1 .3 .05 1 normal
execute as @a[scores={tp_timer=40..}] at @s run particle minecraft:portal ~ ~ ~ .3 1 .3 .1 20 normal
execute as @a[scores={tp_timer=80..}] at @s run particle minecraft:poof ~ ~ ~ .5 .5 .5 .05 20 normal

# Teleport the player above the end portal
execute as @a[scores={tp_timer=120}] in the_end run tp @s 613 234 873

# Send the chat message
execute as @a[scores={tp_timer=120..}] run tellraw @s [{"text":"You find yourself in a familiar place...","color":"gray","italic":true}]

# Remove the item
execute as @a[scores={tp_timer=120..}] run clear @s minecraft:compass{isMagicCompass:1} 1
execute as @a[scores={tp_timer=120..}] run tellraw @s [{"text":"The compass previously in your hand is no more","color":"gray","italic":true}]

# Reset the teleportation timer after teleporting
execute as @a[scores={tp_timer=120..}] run scoreboard players reset @s tp_timer

# Reset the teleportation timer when interrupted
execute as @a[scores={tp_timer=1..},nbt=!{SelectedItem:{tag:{isMagicCompass:1}}}] at @s run title @s subtitle ["",{"text":"Whisking interrupted","color":"dark_aqua"}]
execute as @a[scores={tp_timer=1..},nbt=!{SelectedItem:{tag:{isMagicCompass:1}}}] run scoreboard players reset @s tp_timer

# Blind player before teleporting
execute as @a[scores={tp_timer=85}] at @s run effect give @s minecraft:blindness 3 0 true

# One-time installation
execute if score $loaded magcomp_load matches 0 run function magic_compass:load
