
# ヒット音
    playsound minecraft:entity.player.attack.crit player @a ~ ~ ~ 0.95 1

    #execute at @e[nbt={ActiveEffects:[{Id:24,Amplifier:5b}]}] run particle end_rod ~ ~2.5 ~ 0.1 0.1 0.1 0.02 22
    
# ダメージを設定
    data modify storage formchanger_score_damage: Damage set value 3.10
    execute at @s run function formchanger_score_damage:api/attack

# 確率盲目＆鈍足二秒
    execute if predicate formchanger:random/35p run tag @s add Yes_effect

    execute if entity @s[tag=Yes_effect] run effect give @s blindness 2 1
    execute if entity @s[tag=Yes_effect] run effect give @s slowness 2 1
    execute if entity @s[tag=Yes_effect] run particle smoke ~ ~1 ~ 0.01 0.1 0.01 2 30

    tag @s remove Yes_effect

# 停止付与
    execute if entity @s[tag=AD] run scoreboard players set @s DP_Cooldown 20
    execute if entity @s[tag=AD] run data modify entity @s NoAI set value true 
    
    tag @s remove AD
    tag @s remove BD
