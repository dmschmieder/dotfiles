set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/vundle
call vundle#begin('~/.config/nvim/bundle')

Plugin 'fatih/vim-go'
Plugin 'nvie/vim-flake8'
Plugin 'Valloric/YouCompleteMe'
Plugin 'hdima/python-syntax'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'jeetsukumaran/vim-buffergator'

call vundle#end()

" Opts
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
syntax on
filetype indent plugin on
set ignorecase
set smartcase
set backspace=indent,eol,start

set autoindent
set smartindent

" Turn off highlighting until next search
nnoremap <C-L> :nohl<CR><C-L>

" Go integration
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

au FileType go nmap <Leader>s <Plug>(go-implements)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

" Use HTML syntax highlighting on handlebars files
autocmd BufNewFile,BufRead *.handlebars set syntax=html

" set background=dark
" set t_Co=256
colorscheme molokai

set timeout
set timeoutlen=750
set ttimeoutlen=50
set mouse=i
set ruler
set scrolloff=5

" Show extra whitespace
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_highlight_all=1

let g:airline_theme='dark'

let g:ycm_goto_buffer_command = 'vertical-split'

hi ColorColumn ctermbg=darkgrey

fun! ToggleCC()
    if &cc == ''
        set cc=80,120
    else
        set cc=
    endif
endfun

nnoremap <F2> :call ToggleCC()<CR>

set splitright
set splitbelow

nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" CTRLP
let g:ctrlp_map = '<C-p>'
set wildignore+=*/OUT/*
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
" Use nearest git directory as cwd
let g:ctrlp_working_path_mode = 'r'
"" Bindings for CTRLP modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Folding
" set foldmethod=indent
" set foldlevel=99

let g:SimpylFold_docstring_preview = 0
" Use space as fold command
nnoremap <space> za

" Airline buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

set hidden

" CLose current buffer and move to next
nmap <leader>bq :bp <BAR> bd #<CR>

nmap <leader>q :bdelete<CR>
nmap <leader>u :bunload<CR>
nmap <leader>c :close<CR>
