# 配列の読み込み
data modify storage ckenja.clatter: Items set from block ~ ~-2 ~ Items
execute store result score #tmp.length ckenja.clatter run data get storage ckenja.clatter: Items

# ランダムに目標のインデックスを決定する
function #math:random
execute store result score #tmp.index ckenja.clatter run data get storage math: out
    # この乱数は0..INT_MAXだからリストの要素数で割った余りを求めて0..nにする。nが十分に小さければ無視できるほど小さい偏りとなるはず
    scoreboard players operation #tmp.index ckenja.clatter %= #tmp.length ckenja.clatter

# 止まるまでに出力する文字列の数を決める
function #math:random
execute store result score #steps ckenja.clatter run data get storage math: out
    # この乱数は0..INT_MAXだからリストの要素数で割った余りを求めて0..nにする。nが十分に小さければ無視できるほど小さい偏りとなるはず
    scoreboard players operation #steps ckenja.clatter %= #3 ckenja.clatter
scoreboard players add #steps ckenja.clatter 38

# その数をリストの長さで割った余りを求める
scoreboard players operation #tmp.init ckenja.clatter = #steps ckenja.clatter
scoreboard players operation #tmp.init ckenja.clatter %= #tmp.length ckenja.clatter

# 余り-目標のインデックス=最初に出力する文字列のインデックス
scoreboard players operation #tmp.init ckenja.clatter -= #tmp.index ckenja.clatter

# 最初の文字列を設定する
data modify storage ckenja.clatter: MutableItems set from storage ckenja.clatter: Items
execute if score #tmp.init ckenja.clatter matches 1.. run function ckenja.clatter:internal/start/loop

# ルーレット開始
title @a times 0 128 32
scoreboard players set #sound ckenja.clatter 0
scoreboard players set #counter ckenja.clatter -18
scoreboard players set #interval ckenja.clatter 1
scoreboard players operation #timer ckenja.clatter = #interval ckenja.clatter
playsound botania:enchanter_form master @a ~ ~ ~ 0.5 1 0.5
schedule function ckenja.clatter:internal/tick/check_timer 2s
