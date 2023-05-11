filetype off
syntax enable
set number
set tabstop=4
set softtabstop=4
set hlsearch
set incsearch
set shiftwidth=4
set expandtab
set autoindent
set cindent
set nocompatible
set colorcolumn=100
set smartcase
set background=dark
set termguicolors
set cursorline
set laststatus=2
set showcmd
set wildmenu
set showmatch
set lazyredraw
filetype plugin indent on
set wildignore+=*.o,.git,CMakeFiles,CMakeCache.txt
set hidden
set noswapfile

let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

set backspace=indent,eol,start

call plug#begin('~/.local/share/nvim/site/plugged')
    "Plug 'arcticicestudio/nord-vim'
    Plug 'github/copilot.vim'
    Plug 'sainnhe/everforest' 
    Plug 'rust-lang/rust.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neoclide/coc-highlight'
    Plug 'rust-lang/rust.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
    Plug 'preservim/nerdtree'


call plug#end()

colorscheme everforest

let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"
"Shift + K to show documentation for a function
nnoremap <silent> K :call <SID>show_documentation()<CR>

"Allow scrolling through coc pop-ups with control+arrow keys
nnoremap <nowait><expr> <C-Down> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-Up> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-Down> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-Up> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

"Allow scrolling through coc pop-ups with control f and control b
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>n :NERDTreeFocus<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
