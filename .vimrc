"" Basic setup
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
set encoding=utf-8    " Set default encoding to UTF-8
set mouse=a
set pastetoggle=<F10>
syntax enable         " Turn on syntax highlighting allowing local overrides
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Remaps
nnoremap <leader>\ :nohl<CR>
nnoremap <C-i> :vs<CR>
nnoremap ;; :
inoremap <C-v> <F10><C-r>+<F10>
inoremap jj <Esc>
noremap <C-y> <C-a>
noremap <C-[> <C-t>
vnoremap <C-c> "+y
noremap   <buffer> K      :s,^\(\s*\)[^# \t]\@=,\1#,e<CR>:nohls<CR>zvj
map <C-n> :NERDTreeToggle<CR>

""Bundles
Bundle 'kien/ctrlp.vim'
Bundle 'JazzCore/ctrlp-cmatcher'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kchmck/vim-coffee-script'
Bundle 'ervandew/supertab.git'
Bundle 'flazz/vim-colorschemes'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'gmarik/vundle'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'tpope/vim-rails'
Bundle 'digitaltoad/vim-jade'
Bundle 'jnwhiteh/vim-golang'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'FredKSchott/CoVim'
Bundle 'vim-scripts/loremipsum'
Bundle 'mattn/emmet-vim'
Bundle 'tpope/vim-markdown'
Bundle 'itspriddle/vim-stripper'

""
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
call pathogen#infect()

""CoVim Settings
let CoVim_default_name = "ian"
let CoVim_default_port = "8080"

" Use system clipboard
set clipboard=unnamedplus

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256

" Use 256 colors
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

"" Colorscheme
syntax enable
"colorscheme aiseered
colorscheme grb256
"" Whitespace
filetype plugin indent on
filetype indent on

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is four spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

""
"" Exceptions to whitespace defaults
""

autocmd FileType make setlocal noexpandtab

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
" off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
" off and the line continues beyond the right of the screen

""
"" Searching
""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" Wild settings
""

" TODO: Investigate the precise meaning of these settings
" set wildmode=list:longest,list:full

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

""
"" Backup and swap files
""

set backupdir=~/.vim/_backup/    " where to put backup files.
set directory=~/.vim/_temp/      " where to put swap files.

au Filetype make setlocal noexpandtab

"comment lines
fu! CommentLineANSI()
  if empty(matchstr(getline('.'),'^\s*/\*.*\*/\s*'))
    :s/^\(.*\)$/\/*\1*\//
  else
    :s/^\/\*\(.*\)\*\//\1/
  endif
  :silen!
endfunction
fu! CommentBlock()
  :'< s/^/\/*/
  :'> s/$/*\//
endfu
nmap <C-_> :call CommentLineANSI()<CR>
imap <C-_> <C-0> :call CommentLineANSI()<CR>
vmap <C-_> :call CommentLineANSI()<CR>gv
highlight Pmenu ctermfg=green ctermbg=black

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
