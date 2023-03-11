    execute as @a at @s run function formchanger:player/

# FIXME: 常時実行コマンドを削減するため以下のコマンドをformchanger:player/ に移動
    execute as @a at @s[predicate=formchanger:goods/gradeup_kit_on_mainhand] run function formchanger:player/notice