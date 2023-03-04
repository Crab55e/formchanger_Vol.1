
# 強化条件加算　＜変化させた回数＞
    execute if entity @s[predicate=formchanger:batterys/ex_battery/grow_battery_on_offhand] run scoreboard players add @s Grow_count 9
    scoreboard players add @s Grow_count 1

# アイテムの交換
    # エレクトツール関連
        execute if predicate formchanger:electtool_on_mainhand run loot replace entity @s weapon.mainhand loot formchanger:electtools/electaxe
        execute if predicate formchanger:electchanger_on_mainhand run loot replace entity @s weapon.mainhand loot formchanger:electtools/electchangers/electchangeraxe
        execute if predicate formchanger:boltaction_on_mainhand run loot replace entity @s weapon.mainhand loot formchanger:electtools/electchangers/boltactions/boltactionaxe
        execute if predicate formchanger:telewave_on_mainhand run loot replace entity @s weapon.mainhand loot formchanger:electtools/electchangers/telewaves/telewaveaxe
        execute if predicate formchanger:re_electchanger_on_mainhand run loot replace entity @s weapon.mainhand loot formchanger:electtools/electchangers/boltactions/re_electtools/reelecttoolaxe
        execute if predicate formchanger:teleanleaser_on_mainhand run loot replace entity @s weapon.mainhand loot formchanger:electtools/electchangers/telewaves/teleanleasers/teleanleaseraxe

    # シュルカーズレプリカ関連
        execute if predicate formchanger:shulkers_replica/shulkers_replica_on_mainhand run loot replace entity @s weapon.mainhand loot formchanger:shulkers_replicas/shulkers_replicaaxe
        execute if predicate formchanger:shulkers_replica/shulkers_disguise_on_mainhand run loot replace entity @s weapon.mainhand loot formchanger:shulkers_replicas/shulker_disguises/shulker_disguiseaxe
        execute if predicate formchanger:shulkers_replica/levitater_on_mainhand run loot replace entity @s weapon.mainhand loot formchanger:shulkers_replicas/levitaters/levitateraxe
        execute if predicate formchanger:shulkers_replica/shulkers_copy_on_mainhand run loot replace entity @s weapon.mainhand loot formchanger:shulkers_replicas/shulker_disguises/shulkers_copys/shulkers_copyaxe
        execute if predicate formchanger:shulkers_replica/floweffecter_on_mainhand run loot replace entity @s weapon.mainhand loot formchanger:shulkers_replicas/levitaters/floweffecters/floweffecteraxe
        execute if predicate formchanger:shulkers_replica/perfectmatch_on_mainhand run loot replace entity @s weapon.mainhand loot formchanger:shulkers_replicas/shulker_disguises/shulkers_copys/perfectmatches/perfectmatchaxe
        execute if predicate formchanger:shulkers_replica/airarts_on_mainhand run loot replace entity @s weapon.mainhand loot formchanger:shulkers_replicas/levitaters/floweffecters/airartses/airartsaxe

    # トランスマジック関連
        execute if predicate formchanger:trancemagic/mainhand/trancemagic_on_mainhand run loot replace entity @s weapon.mainhand loot formchanger:trancemagics/trancemagicaxe
        
# サウンドやらエフェクトを発生！
    playsound block.iron_trapdoor.close player @s ~ ~ ~ 1.2 1.1
    playsound block.iron_trapdoor.open player @s ~ ~ ~ 0.5

    particle sonic_boom ~ ~1 ~

# マジックトランスならリセット
    scoreboard players reset @s Nia_M_Sneaktime