call plug#begin()

" Navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'

" Style and colors
Plug 'bling/vim-airline'
Plug 'godlygeek/csapprox'
Plug 'ryanoasis/vim-devicons'

" Editing
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'bronson/vim-trailing-whitespace'

" Coding
Plug 'Shougo/deoplete.nvim' " Asynchronous completion
Plug 'benekastah/neomake'
Plug 'scrooloose/nerdcommenter'
"Plug 'tpope/vim-endwise' "messes up UltiSnip <CR> completion
Plug 'tpope/vim-eunuch'
Plug 'edsono/vim-matchit'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Ruby & Rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'kchmck/vim-coffee-script'
Plug 'slim-template/vim-slim'

Plug 'ap/vim-css-color'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'rhysd/vim-crystal'
Plug 'PProvost/vim-ps1'
Plug 'chase/vim-ansible-yaml'
Plug 'greyblake/vim-preview'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'cespare/vim-toml'
call plug#end()
