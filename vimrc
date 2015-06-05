scriptencoding utf-8
" .vimrc - Inicialização vim.
"
"
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=eol,start

" Enable a nice big viminfo file
set viminfo='500,f1,:500,/500
set history=200

" show the cursor position all the time
set ruler

" display incomplete commands
set showcmd

" do incremental searching
set incsearch

" Show full tags when doing search completion
set showfulltag

" Speed up macros
set lazyredraw


" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  "autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else
  " always set autoindenting on
  set autoindent

endif " has("autocmd")

" set key to toggle paste mode ( disable indent )
set pastetoggle=<F2>
set showmode

" Default indentation settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
" Tabs will transform in spaces
set expandtab
" Tabs continuing /t
"set noexpandtab

" Switch syntax highlighting on
syntax on
"set cursorline

" Display line numbers
set number

" Toggle line numbers
nnoremap <silent><F3> :set number!<cr>

" Scroll with 3 lines of border
set scrolloff=3

" No beep Flash screen when some error occours.
"set visualbell

" Highlight strings inside C comments
let c_comment_strings=1

if (&term =~ "xterm") || has("gui_running")
    set list listchars=tab:»\ ,trail:·
else
    set list listchars=tab:>\ ,trail:-
endif

" Disable search highlight
set nohlsearch

" http://vim.wikia.com/wiki/Quickly_adding_and_deleting_empty_lines
" Ctrl-j/k insert blank line below/above.
" nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
" nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" adds ctrlP: https://kien.github.io/ctrlp.vim/
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" highlight useless whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
