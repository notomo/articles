scriptencoding utf-8

let s:dir_type_name = 'myfiler_dir'
let s:file_type_name = 'myfiler_file'

if empty(prop_type_get(s:dir_type_name))
    call prop_type_add(s:dir_type_name, {'highlight': 'String'})
endif
if empty(prop_type_get(s:file_type_name))
    call prop_type_add(s:file_type_name, {})
endif

function! s:filer(path) abort
    let s:bufnr = bufnr('%')
    let path = fnamemodify(a:path, ':p:gs?\?\/?:s?[^:]\zs\/$??')
    let s:files = glob(path . '/*', v:false, v:true)
    silent %delete _
    call setline(1, ['..'] + map(copy(s:files), {_, v -> fnamemodify(v, ':t')}))
    setlocal nomodified buftype=nofile bufhidden=wipe

    let s:props = {} " idをkeyにしたdictにpropertyをもたせて管理する

    let line = 1
    let paths = [fnamemodify(path, ':h:s?^\.$?\/?')] + map(copy(s:files), {_, v -> fnamemodify(v, ':p:gs?\?\/?')})
    for path in paths
        let id = line " 特に支障がないので行数をid代わりにする
        let is_dir = isdirectory(path)
        call prop_add(line, 1, {'length': len(getline(line)), 'type': is_dir ? s:dir_type_name : s:file_type_name, 'id': id})
        let prop = {'path': path, 'is_dir': is_dir}
        let s:props[id] = prop
        let line += 1
    endfor
endfunction

function! s:open() abort
    let props = prop_list(line('.'))
    if empty(props)
        return
    endif

    let prop = s:props[props[0].id]
    if prop.is_dir
        return s:filer(prop.path)
    endif
    execute 'edit' prop.path
endfunction

tabedit | call s:filer('.')
nnoremap <buffer> <CR> :<C-u>call <SID>open()<CR>
