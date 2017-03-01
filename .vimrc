"copy word under cursor byw
"*  ciw (change inner word) type then <ESC> n to next occurrence . to repeat
"
"https://gist.github.com/JeffreyWay/6753834
set nocompatible   " Disable vi-compatibility
set encoding=utf-8
source ~/.vim/plugins.vim

let s:is_osx = 0
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    let s:is_osx = 1
  endif
endif

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

set t_Co=256
"color morning
"color evening
hi Visual term=reverse cterm=reverse guibg=Grey
"set background=dark
"colorscheme solarized
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar

"set showmode                    " always show what mode we're currently editing in
"set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set paste
set pastetoggle=<leader>p
"set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
"set number                      " always show line numbers
set ignorecase                  " ignore case when searching


set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell           " don't beep
set noerrorbells         " don't beep
set hidden				"allows cycling buffers without saving
"set autowrite  "Save on buffer switch
set mouse=


"one key command mode
nmap ; :

" delete line
nnoremap <C-E> "_dd
nnoremap <C-Y> :NERDTreeToggle<cr>

"cycle buffer
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

"buffer del
nmap <leader>d :bd<cr>
nmap <leader>q :q<cr>
" Fast saves
"nmap <leader>w :w!<cr>
nmap <leader>w :update<cr>
imap <leader>w <Esc>:update<cr>
map! <leader>w <Esc>:update<cr>

nmap <leader>r :e ~/.vimrc<cr>

" Down is really the next line
"nnoremap j gj
"nnoremap k gk

"Easy escaping to normal model
imap jj <esc>

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
" CDC = Change to Directory of Current file
command! CD cd %:p:h

" http://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()

"easier window navigation

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"move cursor in insert mode 
inoremap <c-h> <C-o>h
inoremap <c-j> <C-o>j
inoremap <c-k> <C-o>k
inoremap <c-l> <C-o>l

"Resize vsplit
"nmap <C-v> :vertical resize +5<cr>
"nmap 25 :vertical resize 40<cr>
"nmap 50 <c-w>=
"nmap 75 :vertical resize 120<cr>

"nmap <C-b> :NERDTreeToggle<cr>

"Load the current buffer in Chrome
"nmap ,c :!open -a Google\ Chrome<cr>

"Show (partial) command in the status line
set showcmd

" Create split below
nmap :sp :rightbelow sp<cr>

" Quickly go forward or backward to buffer
"nmap :bp :BufSurfBack<cr>
"nmap :bn :BufSurfForward<cr>

highlight Search cterm=underline

" Swap files out of the project root
"set backupdir=~/.vim/backup//
"set directory=~/.vim/swap//

" Easy motion stuff
"let g:EasyMotion_leader_key = '<Leader>'

" Powerline (Fancy thingy at bottom stuff)
let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Enable the list of buffers

if s:is_osx
"    let g:airline_powerline_fonts = 1
endif
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='simple'
let g:airline_theme='light'
"
" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'


autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch

" Remove search results
command! H let @/=""

"map <Leader>t :!phpunit %<cr>

" Abbreviations
abbrev fn function(){}
abbrev gm !php artisan generate:model

" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e

" Edit todo list for project
nmap ,todo :e todo.txt<cr>

" UltiSnips Stuff

let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips/"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
if s:is_osx
let g:UltiSnipsExpandTrigger="÷"
let g:UltiSnipsListSnippets="¿"
else
let g:UltiSnipsExpandTrigger="/"
let g:UltiSnipsListSnippets="?"
endif
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" CtrlP Stuff

" Familiar commands for file/symbol browsing
"map <D-p> :CtrlP<cr>
"map <C-r> :CtrlPBufTag<cr>

" I don't want to pull up these folders/files when calling CtrlP
"set wildignore+=*/bundle/**

" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>

" Create/edit file in the current directory
nmap :ed :edit %:p:h/

syntax on

"http://stackoverflow.com/questions/12625722/vim-toggling-buffer-overwrite-behavior-when-deleting
function! ToggleSideEffects()
    if mapcheck("dd", "n") == ""
        noremap dd "_dd
        noremap D "_D
        noremap d "_d
        noremap X "_X
        noremap x "_x
        echo 'Delete goes to black hole'
    else
        unmap dd
        unmap D
        unmap d
        unmap X
        unmap x
        echo 'Delete behaves normally'
    endif
endfunction
nnoremap ,, :call ToggleSideEffects()<CR>


" source a host specific config
let localvimrc =expand("~/.vimrc.local") 
if filereadable(localvimrc)
	execute 'source '.fnameescape(localvimrc)
endif
