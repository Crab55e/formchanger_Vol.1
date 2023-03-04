
# 防具立てを召喚
    #execute at @s positioned ^ ^ ^-1.5 run summon armor_stand ~ ~ ~1 {Tags:[Slash_1],Rotation:[0f]}
    #execute at @s positioned ^ ^ ^-1.5 run summon armor_stand ~ ~ ~-1 {Tags:[Slash_1],Rotation:[180f]}
    #execute at @s positioned ^ ^ ^-1.5 run summon armor_stand ~-1 ~ ~ {Tags:[Slash_1],Rotation:[270f]}
    #execute at @s positioned ^ ^ ^-1.5 run summon armor_stand ~1 ~ ~ {Tags:[Slash_1],Rotation:[90f]}

    execute at @s run summon armor_stand ^ ^ ^0.05 {Tags:[Slash_1,Slash_P],NoGravity:true,Small:true,Invisible:true}
    execute as @e[tag=Slash_1] at @s run tp @s ^ ^ ^ facing entity @p[sort=nearest,limit=1]

    execute at @s run summon armor_stand ^ ^ ^-0.05 {Tags:[Slash_2,Slash_P],NoGravity:true,Small:true,Invisible:true}
    execute as @e[tag=Slash_2] at @s run tp @s ^ ^ ^ facing entity @p[sort=nearest,limit=1]

    execute at @s run summon armor_stand ^ ^ ^0.05 {Tags:[Slash_3,Slash_P],NoGravity:true,Small:true,Invisible:true}
    execute at @s run summon armor_stand ^ ^ ^0.05 {Tags:[Slash_4,Slash_P],NoGravity:true,Small:true,Invisible:true}

    execute as @e[tag=Slash_3,tag=Slash_4] at @s run tp @s ^ ^ ^ facing entity @p[sort=nearest,limit=1]

    execute as @e[tag=Slash_3] run tp @s ~ ~ ~ ~90 0 
    execute as @e[tag=Slash_4] run tp @s ~ ~ ~ ~-90 0

    execute at @s run summon armor_stand ^ ^ ^-2.85 {Tags:[Slash_5,Slash_P],NoGravity:true,Small:true,Invisible:true}



# 実行座標を召喚！＆パーティクル・ヒット
    execute as @e[tag=Slash_P,tag=!Slash_5] at @s positioned ^ ^ ^3 positioned ~ ~1 ~ rotated as @e[tag=Slash_P,tag=!Slash_5] positioned ^ ^ ^0.1 rotated as @e[tag=Slash_P,tag=!Slash_5] positioned ^ ^ ^0.2 rotated as @e[tag=Slash_P,tag=!Slash_5] positioned ^ ^ ^0.4 rotated as @e[tag=Slash_P,tag=!Slash_5] positioned ^ ^ ^0.8 rotated as @e[tag=Slash_P,tag=!Slash_5] positioned ^ ^ ^1.6 rotated as @e[tag=Slash_P,tag=!Slash_5] positioned ^ ^ ^3.2 unless entity @e[tag=Slash_5,distance=..5] if entity @s[distance=4.2..5] run particle end_rod ~ ~ ~ 0 0 0 0.0001 2 normal
    execute as @e[tag=Slash_P,tag=!Slash_5] at @s positioned ^ ^ ^3 positioned ~ ~1 ~ rotated as @e[tag=Slash_P,tag=!Slash_5] positioned ^ ^ ^0.1 rotated as @e[tag=Slash_P,tag=!Slash_5] positioned ^ ^ ^0.2 rotated as @e[tag=Slash_P,tag=!Slash_5] positioned ^ ^ ^0.4 rotated as @e[tag=Slash_P,tag=!Slash_5] positioned ^ ^ ^0.8 rotated as @e[tag=Slash_P,tag=!Slash_5] positioned ^ ^ ^1.6 rotated as @e[tag=Slash_P,tag=!Slash_5] positioned ^ ^ ^3.2 unless entity @e[tag=Slash_5,distance=..5] if entity @s[distance=2.4..4.3] run particle cloud ~ ~ ~ 0 0 0 0.01 1 normal

    playsound block.amethyst_block.hit player @a ~ ~ ~ 1.9 0.75 
    
    execute at @s as @e[distance=0.2..4.1,type=!player] run tag @s add A
    execute at @s as @e[distance=4.1..5.3,type=!player] run tag @s add C
    execute at @e[tag=Slash_5] as @e[distance=..9,type=#formchanger:enemy] run tag @s add B
    
    execute at @s as @e[tag=C,tag=B] run effect give @s glowing 3 5 true


    execute as @e[tag=A,tag=B] run function formchanger:use/ex/prizm_slash/damages/slash_p_n
    execute as @e[tag=C,tag=B] run function formchanger:use/ex/prizm_slash/damages/slash_p_c

    tag @e remove A
    tag @e remove B
    tag @e remove C

    #execute if entity @e[tag=SAY] run function formchanger:use/ex/flowbrast_damage
    #execute if entity @e[tag=SAY] run tag @e[tag=SAY] remove SAY
        playsound item.crossbow.loading_end player @a ~ ~ ~ 2 1.2 
        playsound block.amethyst_block.hit player @s ~ ~ ~ 1.8 2


# ｻﾖﾅﾗ防具立て、、
    kill @e[tag=Slash_P]

