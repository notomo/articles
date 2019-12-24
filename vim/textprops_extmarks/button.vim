scriptencoding utf-8

let s:namespace = nvim_create_namespace('myplugin')
let s:props = {}

function! s:set_button(name, pos, hl_name) abort
    let [line, col] = a:pos
    let bufnr = bufnr('%')

    let current_text = getline(line)
    let left = current_text[:col - 1]
    let text = left . repeat(' ', col - 1 - strlen(left)) . a:name . current_text[col - 1:]
    call nvim_buf_set_lines(bufnr, line - 1, line, v:true, [text])
    call nvim_buf_add_highlight(bufnr, s:namespace, a:hl_name, line - 1, col - 1, col + strlen(a:name) - 1)

    let id = nvim_buf_set_extmark(bufnr, s:namespace, 0, line - 1, col - 1, {})
    let s:props[id] = {
        \ 'name': a:name,
        \ 'func': { -> s:save()},
    \ }
endfunction

function! s:click() abort
    let index = line('.') - 1
    let marks = nvim_buf_get_extmarks(bufnr('%'), s:namespace, [index , 0], [index, -1], {})
    let current_col = col('.') - 1
    for [id, _, col] in marks
        let prop = s:props[id]
        if col <= current_col && current_col < col + strlen(prop.name)
            return prop.func()
        endif
    endfor
endfunction

function! s:save() abort
    echomsg 'Saved!'
    setlocal nomodified
endfunction

tabedit memo://scratch
let s:bufnr = bufnr('%')
silent! %delete _
call nvim_buf_clear_namespace(s:bufnr, s:namespace, 0, -1)

augroup memo
    autocmd!
    autocmd BufWriteCmd <buffer> call s:save()
augroup END

call s:set_button('💾 Save ', [1, 3], 'DiffAdd')

setlocal nolist
setlocal buftype=acwrite
setlocal nomodified
setlocal bufhidden=wipe

nnoremap <buffer> <CR> :<C-u>call <SID>click()<CR>
