scriptencoding utf-8

" プラグイン用にnamespaceを定義してextmarkやhighlightを扱う
let s:namespace = nvim_create_namespace('myfiler')

function! s:filer(path) abort
    let s:bufnr = bufnr('%')
    let s:files = glob(a:path . '/*', v:false, v:true)
    %delete _
    call setline(1, ['..'] + map(copy(s:files), {_, v -> fnamemodify(v, ':t:r')}))
    setlocal nomodified buftype=nofile bufhidden=wipe

    call nvim_buf_clear_namespace(s:bufnr, s:namespace, 0, -1) " 前のpathの分を一括でclearしておく
    let s:props = {} " idをkeyにしたdictにpropertyをもたせて管理する

    let line = 0
    let paths = [fnamemodify(a:path, ':p:s?\/$??:h:s?^\.$?\/?')] + map(copy(s:files), {_, v -> fnamemodify(v, ':p')})
    for path in paths
        let id = nvim_buf_set_extmark(s:bufnr, s:namespace, 0, line, 0, {})
        let is_dir = isdirectory(path)
        if is_dir
            call nvim_buf_add_highlight(s:bufnr, s:namespace, 'String', line, 0, -1)
        endif
        let prop = {'path': path, 'is_dir': is_dir}
        let s:props[id] = prop

        call nvim_buf_set_virtual_text(s:bufnr, s:namespace, line, [[string(prop), 'Comment']], {}) " デバッグに便利
        let line += 1
    endfor
endfunction

function! s:open() abort
    let index = line('.') - 1
    " 現在行のextmarkをすべて取得する (:h api-indexing の通り-1は最終行(または列)を示す)
    let marks = nvim_buf_get_extmarks(bufnr('%'), s:namespace, [index , 0], [index, -1], {})
    if empty(marks)
        return
    endif

    let prop = s:props[marks[0][0]] " marks = [[id, line, col], ..]
    if prop.is_dir
        return s:filer(prop.path)
    endif
    execute 'edit' prop.path
endfunction

tabedit | call s:filer('.')
nnoremap <buffer> <CR> :<C-u>call <SID>open()<CR>
