execute 'runtime!' 'plugins.vim'
execute 'runtime!' 'style.vim'

" Settings for YouCompleteMe + UltiSnips
let g:ycm_key_list_select_completion=["<tab>"]
let g:ycm_key_list_previous_completion=["<S-tab>"]

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsExpandTrigger="<nop>"
let g:ulti_expand_or_jump_res = 0
function! <SID>ExpandSnippetOrReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<CR>"
  endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"

" Fast editing of init.vim
map <leader>e :vsp ~/.config/nvim/init.vim<cr>
autocmd! bufwritepost init.vim execute 'runtime!' 'init.vim'

" Fast editing of plugins.vim
map <leader>p :vsp ~/.config/nvim/plugins.vim<cr>
autocmd! bufwritepost plugins.vim execute 'runtime!' 'plugins.vim'

map <leader>n :NERDTreeToggle<cr>

" Fugitive (git)
autocmd User Fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \  nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
autocmd BufReadPost fugitive://* set bufhidden=delete

" GitGutter
" Re-enable default mapping
nmap <Leader>hs <Plug>GitGutterStageHunk

let NERDTreeQuitOnOpen = 1

let g:ctrlp_custom_ignore = {
  \ 'file': '(\.(pyc|pyo|rbc|rbo|class|o)|\~)$\',
  \ 'dir': '\v[\/](\.(git|hg|svn)|(doc|tmp|vendor))$'
  \ }

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
autocmd Filetype make setlocal ts=4 sw=4 sts=0 noexpandtab

" Ruby development
" TODOS
map \q i#TODO<SPACE>
map \w :grep -R --binary-files=without-match --exclude=*~ TODO --exclude=*.html * <CR> :copen <CR>
" Hashrocket to json syntax conversion
nmap <silent> <Leader>h :let _s=@/<Bar>:%s/:\([^=,]*\) =>/\1:/g<Bar>:let @/=_s<Bar>:nohl<CR>
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Delete trailing spaces
nmap <silent> <Leader>s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Search tweaks
" Clear last search
nnoremap <leader><space> :noh<cr>

" Use regular regex syntax (without vim tweaks)
nnoremap / /\v
vnoremap / /\v

" Global replace by default
set gdefault

" Use tab to jump between brackets
"nnoremap <tab> %
nmap <tab> %
vmap <tab> %

autocmd! BufWritePost * Neomake

" scss.css syntax is wonky for me, use plain scss syntax
au BufRead,BufNewFile *.scss set filetype=scss

" refresh with <C-L> which has been mapped
nnoremap <leader>r <C-L>

nmap <leader>o :only<CR>
vmap <leader>o :only<CR>

" Disable arrow keys for movement
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

set viewoptions=folds,cursor

" F9 toggles folding
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

set foldmethod=syntax
autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))
let ruby_fold=1
let xml_syntax_folding=1

" Tabularize shortcuts
nmap <Leader>a= :Tabularize /[\|\&]*=<CR>
vmap <Leader>a= :Tabularize /[\|\&]*=<CR>
nmap <Leader>a> :Tabularize /=>/r1c1l0<CR>
vmap <Leader>a> :Tabularize /=>/r1c1l0<CR>
nmap <Leader>a: :Tabularize /^[^:]*:\zs/l0l1<CR>
vmap <Leader>a: :Tabularize /^[^:]*:\zs/l0l1<CR>
nmap <Leader>a, :Tabularize /,\zs/l0l1<CR>
vmap <Leader>a, :Tabularize /,\zs/l0l1<CR>

" Relative line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" highlight the 81st column of wide lines...
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

set nowrap
set number
set relativenumber
au FocusLost   * :set norelativenumber
au FocusGained * :set relativenumber
au InsertEnter * :set norelativenumber
au InsertLeave * :set relativenumber

"let g:skipview_files = [
            "\ '[EXAMPLE PLUGIN BUFFER]'
            "\ ]
"let g:skipview_file_types = ['gitcommit']
"function! MakeViewCheck()
    "if has('quickfix') && &buftype =~ 'nofile'
        "" Buffer is marked as not a file
        "return 0
    "endif
    "if empty(glob(expand('%:p')))
        "" File does not exist on disk
        "return 0
    "endif
    "if len($TEMP) && expand('%:p:h') == $TEMP
        "" We're in a temp dir
        "return 0
    "endif
    "if len($TMP) && expand('%:p:h') == $TMP
        "" Also in temp dir
        "return 0
    "endif
    "if index(g:skipview_file_types, &filetype) >= 0
        "" File is in filetype skip list
        "return 0
    "endif
    "if index(g:skipview_files, expand('%')) >= 0
        "" File is in skip list
        "return 0
    "endif
    "return 1
"endfunction
"augroup vimrcAutoView
    "autocmd!
    "" Autosave & Load Views.
    "autocmd BufWritePost,BufLeave,WinLeave ?* if MakeViewCheck() | mkview | endif
    "autocmd BufWinEnter ?* if MakeViewCheck() | silent loadview | endif
"augroup end
