set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup' 

Bundle "tpope/vim-surround"
Bundle "tpope/vim-repeat"
Bundle "scrooloose/nerdtree"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-endwise"
Bundle "tomtom/tcomment_vim"
Bundle "Shougo/neocomplcache"
Bundle "mileszs/ack.vim"
Bundle "scrooloose/syntastic"
Bundle "nathanaelkane/vim-indent-guides"
Bundle "godlygeek/tabular"
Bundle "chrisbra/histwin.vim"
Bundle "gregsexton/gitv"
Bundle "altercation/vim-colors-solarized"
Bundle "xolox/vim-session"
Bundle "caio/scala-vim-support"
Bundle "chrismetcalf/vim-yankring"
Bundle "http://github.com/rstacruz/sparkup.git", {'rtp': 'vim/'}


filetype plugin indent on

set number
set ruler
syntax on

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:>.,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar
set laststatus=2

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Command-T configuration
let g:CommandTMaxHeight=20

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Hammer<CR>
endfunction

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
color desert

" Directories for swp files
set backupdir=~/temp/vim/backup
set directory=~/temp/vim/swp

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Show (partial) command in the status line
set showcmd

" from old vimrc.local
set gcr=n:blinkon0
set nolist


nnoremap <Leader>q :q<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> 6j
nnoremap <C-k> 6k
nnoremap <C-l> <C-w>l
noremap <silent> <leader>l :call Toggle_RNU()<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <tab> %
vnoremap <tab> %
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC.local<CR>
nnoremap <leader>v <C-w><C-v><C-w>l
inoremap jj <ESC>


function! Toggle_RNU()
  if &rnu
    execute ':set nu'
  else
    execute ':set rnu'
  endif
endfunction

" Easymotion
" let g:EasyMotion_leader_key = '<Leader>a'

" dduke
nnoremap <Leader>s :w<CR>
set history=1000
set scrolloff=3
set hidden
map Y y$
map j gj
map k gk
" CR in insert mode adds a line
nnoremap <CR> mOo<ESC>`O
nnoremap ' `
nnoremap ` '
nnoremap <Leader>d :bd<CR>
nnoremap <silent> <Leader>. :ls<CR><CR>:b
nnoremap H :bp<CR>
nnoremap L :bn<CR>
nnoremap <Leader>cd :lcd %:p:h<CR>
inoremap <S-TAB> : <C-v><TAB>

"Command T
nnoremap <Leader>c :CommandT<CR>

vnoremap < <gv
vnoremap > >gv

nmap <leader>se :setlocal spell! spelllang=en<CR>

set foldlevelstart=0
set foldmethod=marker

function! MyFoldText()
      let line = getline(v:foldstart)

      let nucolwidth = &fdc + &number * &numberwidth
      let windowwidth = winwidth(0) - nucolwidth - 3
      let foldedlinecount = v:foldend - v:foldstart

      " expand tabs into spaces
      let onetab = strpart('          ', 0, &tabstop)
      let line = substitute(line, '\t', onetab, 'g')

      let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
      let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
      return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction
set foldtext=MyFoldText()
set clipboard+=unnamed
set tags=./tags;$HOME
map <C-/> <plug>NERDCommenterToggle<CR>
imap <C-/> <Esc><plug>NERDCommenterToggle<CR>i
