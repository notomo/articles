
# vim-themisでassertメソッドを追加で定義する

コマンド実行後のカーソル位置やウィンドウ・タブの状態などをassertする場合、  
テストフレームワークの用意した汎用的なassertを直接使用しないほうが読みやすくなる場合が多いと思った。

例えば以下のtestを読むには`:help tabpagenr()`が必要になるはず。

```vim
let s:suite = themis#suite('plugin')
let s:assert = themis#helper('assert')

function! s:suite.add_tab()
    AddTab

    call s:assert.equals(tabpagenr('$'), 2)
endfunction
```

多くあるビルトイン関数の仕様を覚えていられないので、書くときに毎回helpを引くことになって辛い。  
辛いは大げさでも、流れるようには読み書きできない。

これは以下のように書き換えられる。

```vim
let s:suite = themis#suite('plugin')
let s:assert = themis#helper('assert')

function! s:assert.tab_count(expected) abort
    let actual = tabpagenr('$')
    let message = printf('tab count should be %s, but actual: %s', a:expected, actual)
    call self.equals(actual, a:expected, message)
endfunction

function! s:suite.add_tab()
    AddTab

    call s:assert.tab_count(2)
endfunction
```

(既にテストケースを定義するのに使われているが)  
Vim scriptでオブジェクトに見えるものは辞書なので、
メソッドを追加で定義できる。

結局、メソッドに抽出すると再利用性が上がって嬉しいという基本的な話でもある。  
しかし、ものによって欲しいassertメソッドが大きく異なり、
解読困難になりやすいvimプラグインのテストコードだからこそ、  
その基本をこなして可読性を上げていくのが重要になりそう。
