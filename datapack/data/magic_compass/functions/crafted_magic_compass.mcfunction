recipe take @s magic_compass:magic_compass

advancement revoke @s only magic_compass:magic_compass_advancement

give @s minecraft:compass{isMagicCompass:1,uses:5,CustomModelData:371,display:{Name:'[{"text":"Magic Compass","italic":false}]',Lore:['[{"text":"Teleports you back home","italic":false}]']},Enchantments:[{id:soul_speed,lvl:10}]} 1

clear @s minecraft:knowledge_book