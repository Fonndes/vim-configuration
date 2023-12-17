syntax on                   " syntax highlighting
set ignorecase              " case insensitive 
set mouse=a                  " middle-click paste with 
set tabstop=2               " number of columns occupied by a tab 
set softtabstop=2           
set shiftwidth=2            " width for autoindents
set expandtab               " converts tabs to white space
set number                  " add line numbers
set noswapfile              " disable creating swap file
set cursorline
highlight Cursorline cterm=bold
set encoding=utf-8
set nocompatible
set smartcase
set hlsearch
set smarttab
set autoindent
set smartindent
set relativenumber
set wildmode=longest,list
set clipboard=unnamedplus
set ttyfast
set so=30
filetype plugin indent on
set background=dark
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
call plug#end()
" авто открытие NERDtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | wincmd p

nnoremap <space>e :NERDTreeFocus<CR>

" Показывает количество строк в файлах
let g:NERDTreeFileLines = 1
" Игнорировать указанные папки
let g:NERDTreeIgnore = ['^node_modules$', '^__pycache__$']
" Закрыть vim, если единственная вкладка - это NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"

let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

