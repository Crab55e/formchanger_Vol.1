
# FIXME: 常時実行コマンド削減のために、以下のID割り振り処理をformchanger:player/initialize に移動
# ID割り振り
    execute as @e[type=player] unless score @s Play_ID matches 0.. run function formchanger:player/give_id
    #execute as @e[type=!player] unless score @s Mob_ID matches 0.. run function formchanger:player/give_id

# FIXME: 常時実行コマンド削減のために、追加されたアイテムすべてに{CustomItem:1b} などのnbtを付与し、
#        以下の追加したアイテムを検知するためのコマンドを次のように1つのfunctionにまとめる
#        execute if predicate formchanger:is_selected_custom_item run function formchanger:player/selected_custom_item/
# ツールの使用時処理
    # 異物混入でリセット
        # FIXME: 負荷軽減のためにpredicate 1つにまとめ、asではなくifを使用
        execute as @s[tag=Re_set,nbt=!{Inventory:[{Slot:-106b,id:"minecraft:warped_fungus_on_a_stick"}]},nbt={SelectedItem:{tag:{HideFlags:7}}},predicate=!formchanger:battery_on_mainhand] run function formchanger:use/change/reset

    # エレクトツール関連
        execute if predicate formchanger:electtool_on_mainhand run function formchanger:use/items/electtool
        execute if predicate formchanger:electchanger_on_mainhand run function formchanger:use/items/electchanger
        execute if predicate formchanger:boltaction_on_mainhand run function formchanger:use/items/boltaction
        execute if predicate formchanger:telewave_on_mainhand run function formchanger:use/items/telewave
        execute if predicate formchanger:re_electchanger_on_mainhand run function formchanger:use/items/re_electtool
        execute if predicate formchanger:teleanleaser_on_mainhand run function formchanger:use/items/teleanleaser

    # シュルカーズレプリカ関連
        execute if predicate formchanger:shulkers_replica/shulkers_replica_on_mainhand run function formchanger:use/items/shulkers_replicas/shulkers_replica
        execute if predicate formchanger:shulkers_replica/shulkers_disguise_on_mainhand run function formchanger:use/items/shulkers_replicas/shulkers_disguise
        execute if predicate formchanger:shulkers_replica/levitater_on_mainhand run function formchanger:use/items/shulkers_replicas/levitater
        execute if predicate formchanger:shulkers_replica/shulkers_copy_on_mainhand run function formchanger:use/items/shulkers_replicas/shulkers_copy
        execute if predicate formchanger:shulkers_replica/floweffecter_on_mainhand run function formchanger:use/items/shulkers_replicas/floweffecter
        execute if predicate formchanger:shulkers_replica/perfectmatch_on_mainhand run function formchanger:use/items/shulkers_replicas/perfectmatch
        execute if predicate formchanger:shulkers_replica/airarts_on_mainhand run function formchanger:use/items/shulkers_replicas/airarts

        execute if predicate formchanger:electsword/electsword_on_mainhand run function formchanger:use/weapons/electsword
        execute if predicate formchanger:electsword/electbow_on_mainhand run function formchanger:use/weapons/electbow

execute unless predicate formchanger:sneak run scoreboard players reset @s Nia_Sneaktime

# FIXME: あんま理解してないけど以下のコマンドが実行される条件を出来るだけ限定的にするべき
#        ただplayer全員に実行するのだとちょっと多いかも
# スコアボード
    scoreboard players reset @s[scores={Nia_Sneak=1..}] Nia_Sneak
    scoreboard players reset @s[scores={Nia_Sneaktime=555..}] Nia_Sneaktime
    scoreboard players operation @s[scores={M_cooldown=1..}] M_cooldown -= $Constant.value.1 Constant
    scoreboard players operation @s[scores={CH_cooldown=1..}] CH_cooldown -= $Constant.value.1 Constant
    scoreboard players operation @s[scores={EV_cooldown=1..}] EV_cooldown -= $Constant.value.1 Constant
    scoreboard players operation @e[scores={DP_Cooldown=1..}] DP_Cooldown -= $Constant.value.1 Constant
    scoreboard players operation @e[scores={Motionvalue=1..}] Motionvalue -= $Constant.value.1 Constant
    kill @e[scores={Motionvalue=..0}]

    scoreboard players reset @s[predicate=!formchanger:sneak] Nia_Sneaktotaltime
    scoreboard players reset @s[predicate=!formchanger:sneak] Nia_Sneaktime
    scoreboard players reset @s[predicate=!formchanger:sneak] Nia_M_Sneaktime

# FIXME: 7行目と同じく削減
# ツール補正
    # エレクトツール関連
        execute if predicate formchanger:electtool_on_mainhand run scoreboard players operation @s Nia_Sneaktime += $Constant.value.3 Constant
        execute if predicate formchanger:electchanger_on_mainhand run scoreboard players operation @s Nia_Sneaktime += $Constant.value.5 Constant
        execute if predicate formchanger:boltaction_on_mainhand run scoreboard players operation @s Nia_Sneaktime += $Constant.value.10 Constant
        execute if predicate formchanger:telewave_on_mainhand run scoreboard players operation @s Nia_Sneaktime += $Constant.value.5 Constant
        execute if predicate formchanger:re_electchanger_on_mainhand run scoreboard players operation @s Nia_Sneaktime += $Constant.value.15 Constant
            execute if predicate formchanger:re_electchanger_on_mainhand run scoreboard players operation @s Nia_Sneaktotaltime += $Constant.value.15 Constant
        execute if predicate formchanger:teleanleaser_on_mainhand run scoreboard players operation @s Nia_Sneaktime += $Constant.value.10 Constant
            execute if predicate formchanger:teleanleaser_on_mainhand run scoreboard players operation @s Nia_Sneaktotaltime += $Constant.value.10 Constant

    # シュルカーズレプリカ関連
        execute if predicate formchanger:shulkers_replica/shulkers_replica_on_mainhand run scoreboard players operation @s Nia_Sneaktime += $Constant.value.10 Constant
        execute if predicate formchanger:shulkers_replica/shulkers_disguise_on_mainhand run scoreboard players operation @s Nia_Sneaktime += $Constant.value.15 Constant
        execute if predicate formchanger:shulkers_replica/levitater_on_mainhand run scoreboard players operation @s Nia_Sneaktime += $Constant.value.10 Constant
            execute if predicate formchanger:shulkers_replica/levitater_on_mainhand run scoreboard players operation @s Nia_Sneaktotaltime += $Constant.value.10 Constant
        execute if predicate formchanger:shulkers_replica/shulkers_copy_on_mainhand run scoreboard players operation @s Nia_Sneaktime += $Constant.value.20 Constant
        execute if predicate formchanger:shulkers_replica/floweffecter_on_mainhand run scoreboard players operation @s Nia_Sneaktime += $Constant.value.15 Constant
            execute if predicate formchanger:shulkers_replica/floweffecter_on_mainhand run scoreboard players operation @s Nia_Sneaktotaltime += $Constant.value.15 Constant
        execute if predicate formchanger:shulkers_replica/perfectmatch_on_mainhand run scoreboard players operation @s Nia_Sneaktime += $Constant.value.30 Constant
            execute if predicate formchanger:shulkers_replica/perfectmatch_on_mainhand run scoreboard players operation @s Nia_Sneaktotaltime += $Constant.value.30 Constant
        execute if predicate formchanger:shulkers_replica/airarts_on_mainhand run scoreboard players operation @s Nia_Sneaktime += $Constant.value.20 Constant
            execute if predicate formchanger:shulkers_replica/airarts_on_mainhand run scoreboard players operation @s Nia_Sneaktotaltime += $Constant.value.20 Constant

# FIXME: predicateを使用して軽量化
# バッテリー進化
    execute if data entity @s SelectedItem.tag.Status{ItemID:Normal_Battery} run function formchanger:use/items/battery_mainhand

# FIXME: 多分advancementsを使用したほうが良い
# 条件付きスコアボード加算
    execute if predicate formchanger:lightning run scoreboard players add @s Thunder_count 1

# スコアボードリセット
    scoreboard players reset @s R_Click
    execute if predicate formchanger:batterys/ex_battery/save_battery_on_offhand run scoreboard players set @s Nia_Sneaktotaltime -500

# FIXME: @eを使うのは負荷が大きいのでpredicateで条件を設定するか、typeなどで対象を絞る
# 特殊効果の処理
    execute at @e[tag=Nia_Magic] as @s run function formchanger:use/projectile/starting

# FIXME: 7行目と同じく削減
# トランスマジック関連
    # 使用時処理
        execute if predicate formchanger:trancemagic/mainhand/trancemagic_on_mainhand run function formchanger:use/items/trancemagics/mainhand/trancemagic
            execute if predicate formchanger:trancemagic/offhand/trancemagic_on_offhand run function formchanger:use/items/trancemagics/offhand/trancemagic

    # ツール補正
        execute if predicate formchanger:trancemagic/offhand/trancemagic_on_offhand run scoreboard players operation @s[scores={M_cooldown=2..30}] M_cooldown -= $Constant.value.1 Constant

# FIXME: 多分advancementsが使えると思うのでそちらを使うべき
# 魔法処理
    # MP回復
        scoreboard players add @s[scores={MP=..99},predicate=formchanger:trancemagic/mp/mp_100] MP 1

        scoreboard players set @s[tag=MAX_MP] MP 999

    # MP限界
        scoreboard players set @s[scores={MP=101..},predicate=formchanger:trancemagic/mp/mp_100] MP 100

    # 魔法に応じてエフェクトを
        execute at @e[tag=Nia_M] run function formchanger:use/magics/moving/effect

    # 処理
        # 射程がゼロになるまでひき続ける
            scoreboard players remove @e[scores={Range=1..}] Range 1

        # FIXME: 90行目と同じく@eに条件を足す
        # 射程範囲外もしくは何らかの要因でキルタグが付与された奴を消す！
            execute at @e[scores={Range=0}] run function formchanger:use/magics/moving/end
            kill @e[tag=Kill]

    # ダメージ効果
           # execute if entity @e[tag=Hit] run function formchanger:use/magics/damages

    # 動く魔法なら動かしていく
        execute as @e[tag=Move] at @s run function formchanger:use/magics/moving/move
#execute at @e[tag=Move] as @e[tag=Move] run loot spawn ~ ~ ~ loot formchanger:goods/upgrade_kit

tag @s remove Kill

# 特殊効果
    # FIXME: 確かpredicateでeffectの検知をできたはずなのでそっちに、あとformchanger:tickでやったほうがいいかも
    #        それと出来る限り対象を絞る
    execute at @e[nbt={ActiveEffects:[{Id:24,Amplifier:5b}]}] as @s run function formchanger:use/effect/light_stand
    execute as @e[scores={DP_Cooldown=0}] run data modify entity @s NoAI set value false
    execute as @e[scores={DP_Cooldown=0}] run scoreboard players reset @s DP_Cooldown
    # FIXME: ここでも別にいいんだけどadvancementsのほうが軽いと思うので出来ればそっちを
    #        好みと読みやすさとか考えながら
    execute if entity @s[tag=EX_Doppel] run scoreboard players operation @s Nia_Sneaktime += $Constant.value.30 Constant
    execute if entity @s[tag=EX_Doppel] run scoreboard players operation @s Nia_Sneaktotaltime += $Constant.value.30 Constant
    execute if entity @s[scores={DEX_Charge=..0}] run function formchanger:use/ex/doppel_brast/doppel_remove

    # 特殊処理
        # FIXME: 90行目と同じく対象を絞るべき、あと多分formchanger:tick に移動したほうがいいかも
        execute as @e[tag=Get_DPE] at @e[tag=Get_DPE] run function formchanger:use/ex/doppel_brast/get_material
        execute as @e[tag=D_Hole_Core] at @e[tag=D_Hole_Core] run function formchanger:use/ex/doppel_brast/charge_hole
     
        execute as @e[tag=DR_Core] at @e[tag=DR_Core] run function formchanger:use/ex/doppel_brast/dark_commands/d_shadow_ray_chain
        execute as @e[tag=DRA_Core] at @e[tag=DRA_Core] run function formchanger:use/ex/doppel_brast/dark_commands/d_shadow_ray_attack_chain
        execute as @e[tag=DR_ammo] at @e[tag=DR_ammo] run function formchanger:use/ex/doppel_brast/dark_commands/d_shadow_ammo_chain
        execute if entity @s[predicate=!formchanger:shulkers_replica/perfectmatch_on_mainhand,tag=EX_Doppel] run function formchanger:use/ex/doppel_brast/doppel_remove
    
# テスト用
    #scoreboard players operation @s Nia_Sneaktotaltime += $Constant.value.3 Constant
    #scoreboard players operation @s Nia_Sneaktime += $Constant.value.3 Constant
    #execute if predicate formchanger:batterys/ex_battery/pure_battery_on_offhand run data merge entity @s {SelectedItem:{tag:{Enchantments:[{lvl:1s,id:"minecraft:silk_touch"}]}}}
    scoreboard players reset @s Motionvalue
