set tabstop=4
"set softtabstop=0 noexpandtab                   NO IDEA WTF THIS DOES
set shiftwidth=4
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
 Plug 'dracula/vim'
 " Plug 'SirVer/ultisnips'
 Plug 'chriskempson/base16-vim'
 Plug 'honza/vim-snippets'
 Plug 'tpope/vim-sensible'
 Plug 'junegunn/seoul256.vim'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'rust-lang/rust.vim'
 Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'

 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 
 " Better visual guide
 Plug 'Yggdroot/indentLine'
 
 "syntax check"
 Plug 'w0rp/ale'

 " Autocomplete
 Plug 'ncm2/ncm2'
 Plug 'roxma/nvim-yarp'

 Plug 'ncm2/ncm2-bufword'
 Plug 'ncm2/ncm2-path'
 Plug 'ncm2/ncm2-jedi'

 " Fomratter
 Plug 'Chiel92/vim-autoformat'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

filetype plugin indent on

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim

inoremap { {}<ESC>ha
" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
"
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set number
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Configurations Part
" UI configuration
syntax on
syntax enable
let base16colorspace=256
"colorscheme base16-gruvbox-dark-hard
colorscheme dracula
au ColorScheme * hi Normal ctermbg=none guibg=none
set background=dark
" True Color Support if it's avaiable in terminal
if has("termguicolors")
    set termguicolors
endif
if has("gui_running")
  set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw
set scroll=5
" Search configuration
set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase
" Tab and Indent configuration
set expandtab
set shiftwidth=4
" vim-autoformat
noremap <F3> :Autoformat<CR>
" NCM2
augroup NCM2
  autocmd!
  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()
  " :help Ncm2PopupOpen for more information
  set completeopt=noinsert,menuone,noselect
  " When the <Enter> key is pressed while the popup menu is visible, it only
  " hides the menu. Use this mapping to close the menu and also start a new line.
  inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
  " uncomment this block if you use vimtex for LaTex
  " autocmd Filetype tex call ncm2#register_source({
  "           \ 'name': 'vimtex',
  "           \ 'priority': 8,
  "           \ 'scope': ['tex'],
  "           \ 'mark': 'tex',
  "           \ 'word_pattern': '\w+',
  "           \ 'complete_pattern': g:vimtex#re#ncm2,
  "           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
  "           \ })
augroup END

" Press i to enter insert mode, and ii to exit insert mode.
:inoremap ii <Esc>
:inoremap jk <Esc>
:inoremap kj <Esc>
:vnoremap jk <Esc>
:vnoremap kj <Esc>

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
