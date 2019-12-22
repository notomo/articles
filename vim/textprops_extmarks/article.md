# Text properties and Extended marks

VimのText propertiesとNeovimのExtended marksを比較してみます。

## 使用したバージョン

- Vim 8.2
- Neovim v0.5.0-191-g36d1335a6

## 機能概要を比較

### Text property

- `:h textprop`
- Vim 8.1.0579から使用可能
    - https://github.com/vim/vim/commit/98aefe7c3250bb5d4153b994f878594d1745424e
- テキストの範囲にプロパティを付与する
    - 幅が0の範囲も可能
- **テキスト編集とともに移動する**
- テキストを削除すると消える
- ハイライトを指定できる

### Extended marks

- `:h api-extended-marks`
- 2019-12-22現在はnightlyでのみ使用可能
    - https://neovim.io/roadmap/ では0.5になっているが0.4.4が出たらそこに入るはず
    - https://github.com/neovim/neovim/commit/122426966e1046f45801103eace2887ea59d4941
- マークをセットする
- **テキスト編集とともに移動する**
- テキストを削除してもマークは消えない
- 現状ハイライトには`nvim_buf_add_highlight()`を使う
    - 同じapiで扱えるようにする予定はありそう https://github.com/neovim/neovim/issues/6412#issuecomment-290790989
- [tracking issue](https://github.com/neovim/neovim/issues/11400)

## 小さなプラグインを実装して比較

ディレクトリを移動できてファイルを開けるだけのファイラーを実装しました。
どちらも50行弱です。
Text propertyとExtended marksを使っているので、
雑にバッファを編集しても動作するという不要な特徴があります。

- Vim https://github.com/notomo/articles/blob/master/vim/textprops_extmarks/textprops.vim
- Neovim https://github.com/notomo/articles/blob/master/vim/textprops_extmarks/extmarks.vim

以下の差分を見てみると両apiの違いがなんとなく分かります。
idをkeyにしてpropsを管理する必要があるのは同じです。

```diff
--- textprops.vim
+++ extmarks.vim
@@ -1,14 +1,7 @@
 scriptencoding utf-8

-let s:dir_type_name = 'myfiler_dir'
-let s:file_type_name = 'myfiler_file'
-
-if empty(prop_type_get(s:dir_type_name))
-    call prop_type_add(s:dir_type_name, {'highlight': 'String'})
-endif
-if empty(prop_type_get(s:file_type_name))
-    call prop_type_add(s:file_type_name, {})
-endif
+" プラグイン用にnamespaceを定義してextmarkやhighlightを扱う
+let s:namespace = nvim_create_namespace('myfiler')

 function! s:filer(path) abort
     let s:bufnr = bufnr('%')
@@ -18,27 +11,34 @@
     call setline(1, ['..'] + map(copy(s:files), {_, v -> fnamemodify(v, ':t')}))
     setlocal nomodified buftype=nofile bufhidden=wipe

+    call nvim_buf_clear_namespace(s:bufnr, s:namespace, 0, -1) " 前のpathの分を一括でclearしておく
     let s:props = {} " idをkeyにしたdictにpropertyをもたせて管理する

-    let line = 1
+    let line = 0
     let paths = [fnamemodify(path, ':h:s?^\.$?\/?')] + map(copy(s:files), {_, v -> fnamemodify(v, ':p:gs?\?\/?')})
     for path in paths
-        let id = line " 特に支障がないので行数をid代わりにする
+        let id = nvim_buf_set_extmark(s:bufnr, s:namespace, 0, line, 0, {})
         let is_dir = isdirectory(path)
-        call prop_add(line, 1, {'length': len(getline(line)), 'type': is_dir ? s:dir_type_name : s:file_type_name, 'id': id})
+        if is_dir
+            call nvim_buf_add_highlight(s:bufnr, s:namespace, 'String', line, 0, -1)
+        endif
         let prop = {'path': path, 'is_dir': is_dir}
         let s:props[id] = prop
+
+        call nvim_buf_set_virtual_text(s:bufnr, s:namespace, line, [[string(prop), 'Comment']], {}) " デバッグに便利
         let line += 1
     endfor
 endfunction

 function! s:open() abort
-    let props = prop_list(line('.'))
-    if empty(props)
+    let index = line('.') - 1
+    " 現在行のextmarkをすべて取得する (:h api-indexing の通り-1は最終行(または列)を示す)
+    let marks = nvim_buf_get_extmarks(bufnr('%'), s:namespace, [index , 0], [index, -1], {})
+    if empty(marks)
         return
     endif

-    let prop = s:props[props[0].id]
+    let prop = s:props[marks[0][0]] " marks = [[id, line, col], ..]
     if prop.is_dir
         return s:filer(prop.path)
     endif
```

今回の例では編集とともに移動する機能が活きませんでしたが、
ディレクトリをツリー表示する機能を付けると部分更新したくなるので活きてきそうです。

(実は移動する機能を使う簡単な例を思いつきませんでした)

## 感想

とてもざっくり見ると同じだけど実は結構違う機能という印象です。
Text propertiesは範囲指定できてハイライトもできるので、
現状Extended marksより能力があるように思います。
ただ、同じapiでバッファ全体や行内のmarkを取得できたり、virtual_textやhighlightと同じnamespaceのapiを使えたりと、
新しく覚えることは少ないのはNeovimかもしれません。
普段使うのがNeovimなので慣れているだけな気もします。

Popup windowとFloating windowも似たような関係で面白いですね。
機能が成熟したら、得意なことが違うだけになるのかなと妄想しています。

## 余談

この前 https://github.com/neovim/neovim/pull/11449 でextmarksの簡単なバグを見つけて直せたので、
なんとなく好きな機能になりました。
また、これを書いている途中でバグらしきものを見つけたので調べてみます。
