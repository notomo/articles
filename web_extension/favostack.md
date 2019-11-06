
# ブックマークを一番上に追加するよう変更する拡張機能

https://github.com/notomo/favostack

マウスジェスチャ等で一時的に`その他のブックマーク`にブックマークして、  
それが一番下に追加されるのが微妙に嫌だったので、その挙動を変更する拡張を書いた。

整理するのが面倒で量が多いのが本当は良くない。


## 既知の不具合

Chromeでブックマークボタンを押すと、最後に追加されたディレクトリにブックマークが作成される。  
その後ディレクトリを選択して決定すると作成されたブックマークが移動する。
その時それぞれ[bookmarks.onCreated, bookmarks.onMoved](https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/API/bookmarks)が呼ばれる。 

つまりディレクトリを変更してブックマークする場合も一番上に追加するためには、
作成されて最初のonMovedでのみ一番上に移動させる必要がある。
(なぜかonMovedが2回呼ばれている気がするが)

しかし、移動先を変えずにブックマークして、ブックマーク一覧で自分で移動する場合と区別がつかないため、
そのケースでのみ(1度だけ)移動させても一番上に戻ってしまう。

時間経過で挙動を変える以外に方法があればいいが。


## Chrome Web Storeの審査

アイコンなしで説明が1行だと弾かれた。  
弾かれる場合メールが来て、どこがダメだったか教えてくれる。  
その2点を修正した後、再審査はすぐに通った。