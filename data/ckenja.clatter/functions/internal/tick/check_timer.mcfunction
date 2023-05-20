scoreboard players add #counter ckenja.clatter 1
execute if score #counter ckenja.clatter matches 12 run function ckenja.clatter:internal/tick/reset_counter

scoreboard players remove #timer ckenja.clatter 1
execute if score #timer ckenja.clatter matches 0 run function ckenja.clatter:internal/tick/_

execute if score #steps ckenja.clatter matches 0 run schedule function ckenja.clatter:internal/tick/stop 64t
execute if score #steps ckenja.clatter matches 1.. run schedule function ckenja.clatter:internal/tick/check_timer 4t
