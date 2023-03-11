# formchanger_Vol.1

###### commented

### まえがき
読んでもらったら内容の理解がスムーズになるかもしれない
#### 軽量化の面で大事な事
- 常時実行コマンドを極限まで減らす
条件を限定的にして出来るだけ実行されるタイミングを減らす
- 実行対象も減らす
例: `execute as @a run say Hello` ↓
    [Crab555e] Hello
    [nia1111111111] Hello
当然ながら実行対象が増えるってことは常時実行コマンドの増加につながるので機能に問題がない程度には減らしたい
- advancementsを使う
なんかしらんけど軽いらしい、プレイヤーの動作に関する検知なら大体できるのでそういう系は任せたいね
- predicateを使う
なんかしらんけど軽いらしい、nbtを使わずにequipmentsとかで手持ち検知できるの強いよね
- nbtを出来るだけ使わない
そう、これ大事めっちゃ大事、なんかnbtって思いらしいんですよね
例えばこんなのが最悪
`execute as @e if entity @s[nbt={OnGround:1b}] run data get entity @s Brain`
@eという大量のエンティティにnbt検知をさせているところとか、あとはこんなのが良くない
`execute as @a[nbt={Inventiry:[{id:"minecraft:apple"}]}] run title @s actionbar "りんご持ってる！"`
プレイヤーのnbtってめちゃくちゃ重いらしい(教えてもらった)、一気に大量のプレイヤーのnbtを扱いたいときは
一旦data modifyとかでstorageに移してから、移した先のstorageに向かって検知なりなんなりの処理をするのが良いんだって
#### requirements(別の言葉が浮かばなかった(要求って意味、強制ではないんだけどね))
よかったらおすすめの拡張機能あるんでどうぞ
- [TODO-hightlight](https://marketplace.visualstudio.com/items?itemName=wayou.vscode-todo-highlight)

# わっこんな時間だ(1:07)、ねます