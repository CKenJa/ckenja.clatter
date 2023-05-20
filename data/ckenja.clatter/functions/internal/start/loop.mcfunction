scoreboard players remove #tmp.init ckenja.clatter 1
execute if score #tmp.init ckenja.clatter matches 1.. run function ckenja.clatter:internal/button/start.loop
data remove storage ckenja.clatter: MutableItems[-1]
