scriptencoding utf-8

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Show full tags when doing search completion
set showfulltag

" Speed up macros
set lazyredraw

" Defines colorscheme
colorscheme default

" enable 256 color support when available
if ($TERM == "xterm-256color")
  set t_Co=256
endif

" enable all mouse options
set mouse=a

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

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

" Switch syntax highlighting on
syntax on

" Display line numbers
set number
" Display lines relative to each other
set relativenumber
" Boths numbers options together and you have better of both worlds

" Toggle line numbers
nnoremap <silent><F3> :set number! relativenumber!<cr>

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

" Ignore filepatterns when wildcards
set wildignore+=*.pyc,*.so,*.obj,*.exe,*.zip

" Set new splits position
set splitbelow
set splitright

" Enable search highlight
set hlsearch

" Enable cursor line
set cursorline

" Reread file when only modified externaly
set autoread

" Map :make to scons
set makeprg=scons

" Leader key mapping

" Maps a leader key
let mapleader = ','
" Timeout to sequence chars
set timeoutlen=500
" Just a debugging
nnoremap <leader>? :echo("\<leader\> works! It is set to <leader>")<CR>

" http://vim.wikia.com/wiki/Quickly_adding_and_deleting_empty_lines
" Ctrl-j/k insert blank line below/above.
" nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
" nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" highlight useless whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" Pathogen to load all plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" adds ctrlP configuration:
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" syntastic configs:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

nnoremap <leader>c :call SyntasticCheck()<CR>
nnoremap <leader>d :call SyntasticReset()<CR>

" adds vim-airline config

" autoload since it only first appears when splitted by default
set laststatus=2
" optimize performance by not loading too much extensions
let g:airline_extensions = ['quickfix', 'branch', 'tabline', 'ctrlp', 'whitespace', 'syntastic']
" tabs suport
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Colors
hi IncSearch term=reverse cterm=underline ctermfg=none ctermbg=none
hi Search term=reverse cterm=underline ctermfg=none ctermbg=none
hi CursorLine cterm=none ctermfg=None ctermbg=233
hi CursorLineNr cterm=bold ctermfg=113 ctermbg=233

" vim:set ft=vim et sw=2:
