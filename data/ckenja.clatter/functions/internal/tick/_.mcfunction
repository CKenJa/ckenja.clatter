scoreboard players operation #timer ckenja.clatter = #interval ckenja.clatter
scoreboard players remove #steps ckenja.clatter 1
data remove storage ckenja.clatter: MutableItems[-1]
execute unless data storage ckenja.clatter: MutableItems[-1] run data modify storage ckenja.clatter: MutableItems set from storage ckenja.clatter: Items
title @a title {"storage":"ckenja.clatter:","nbt":"MutableItems[-1].tag.display.Name","interpret": true}

execute if data storage ckenja.clatter: MutableItems[-2] run title @a subtitle {"storage":"ckenja.clatter:","nbt":"MutableItems[-2].tag.display.Name","interpret": true}
execute unless data storage ckenja.clatter: MutableItems[-2] run title @a subtitle {"storage":"ckenja.clatter:","nbt":"Items[-1].tag.display.Name","interpret": true}

execute if score #sound ckenja.clatter matches 0 run playsound botania:ding master @a ~ ~ ~ 1 1.334840 1
execute if score #sound ckenja.clatter matches 1 run playsound botania:ding master @a ~ ~ ~ 1 1.681793 1
execute if score #sound ckenja.clatter matches 2 run playsound botania:ding master @a ~ ~ ~ 1 2 1

scoreboard players add #sound ckenja.clatter 1
execute if score #sound ckenja.clatter matches 3 run scoreboard players set #sound ckenja.clatter 0
