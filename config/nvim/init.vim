execute 'runtime!' 'plugins.vim'
execute 'runtime!' 'style.vim'

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:SuperTabDefaultCompletionType = "<c-n>"

" Fast editing of init.vim
map <leader>e :vsp ~/.config/nvim/init.vim<cr>
autocmd! bufwritepost init.vim execute 'runtime!' 'init.vim'

" Fast editing of plugins.vim
map <leader>p :vsp ~/.config/nvim/plugins.vim<cr>
autocmd! bufwritepost plugins.vim execute 'runtime!' 'plugins.vim'

map <leader>n :NERDTreeToggle<cr>
let NERDTreeQuitOnOpen = 1

if has('clipboard')
  set clipboard=unnamed
endif

" Fugitive (git)
autocmd User Fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \  nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
autocmd BufReadPost fugitive://* set bufhidden=delete
map <leader>b :Gblame -wMCCC<cr>

" GitGutter
" Re-enable default mapping
nmap <Leader>hs <Plug>GitGutterStageHunk

" FZF config
nnoremap <silent> <C-p>  :Files<cr>
inoremap <silent> <C-p>  <ESC>:Files<cr>

" See mappings using fzf
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" Use space as a searching prefix
nnoremap    [search]   <Nop>
nmap        <Space> [search]

nnoremap <silent> [search]b  :Buffers<CR>
nnoremap <silent> [search]A  :Windows<CR>
nnoremap <silent> [search];  :BLines<CR>
nnoremap <silent> [search].  :Lines<CR>
nnoremap <silent> [search]o  :BTags<CR>
nnoremap <silent> [search]O  :Tags<CR>
nnoremap <silent> [search]?  :History<CR>
nnoremap <silent> [search]/  :execute 'Ag ' . input('Ag/')<CR>
nnoremap <silent> [search]gl :Commits<CR>
nnoremap <silent> [search]ga :BCommits<CR>

" tab handling
set ts=2 sw=2 expandtab " Default
autocmd Filetype make setlocal ts=4 sw=4 sts=0 noexpandtab

" Ruby development
" TODOS
map \q i#TODO<SPACE>
map \w :grep -R --binary-files=without-match --exclude=*~ TODO --exclude=*.html * <CR> :copen <CR>
" Hashrocket to json syntax conversion
nmap <silent> <Leader>h :let _s=@/<Bar>:%s/:\([^=,]*\) =>/\1:/g<Bar>:let @/=_s<Bar>:nohl<CR>
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Ctags
function! ReCreateTags()
    let pwd = getcwd()
    exec ':!rm -f ' . pwd . '/tags'
    exec ':!ctags -R -f ' . pwd . '/tags ' . pwd
endfunction
nmap <silent> <Leader>t :call ReCreateTags()<CR>

" Delete trailing spaces
nmap <silent> <Leader>s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" NERDCommenter
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDSpaceDelims = 1

" Search tweaks
" Clear last search
nnoremap <leader><space> :noh<cr>

" Use regular regex syntax (without vim tweaks)
nnoremap / /\v
vnoremap / /\v

" Global replace by default
set gdefault
" Do not stop between pages on 'argdo'
set nomore

" Use tab to jump between brackets
"nnoremap <tab> %
"nmap <tab> %
"vmap <tab> %

" Select last pasted text with gp
nnoremap gp `[v`]

" Neomake for asynchronous linting
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
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
"autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))
autocmd BufWinEnter * let &foldlevel = 1
function! MakeViewCheck()
    if has('quickfix') && &buftype =~ 'nofile'
	" Buffer is marked as not a file
	return 0
    endif
endfunction
let ruby_fold=1
let xml_syntax_folding=1

" EasyAlign shortcuts
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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
