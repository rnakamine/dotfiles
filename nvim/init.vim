set fenc=utf-8
set nowritebackup
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set wildmenu
set cursorline
set virtualedit=onemore
set smartindent
set visualbell
set showmatch
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set clipboard+=unnamedplus
set shortmess-=S
set laststatus=2
set ruler
set splitbelow
set splitright
set nohlsearch

let mapleader = "\<Space>"

if has("autocmd")
    autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
endif

if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile                                                                                                                                   
endif

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-commentary'
Plug 'mattn/vim-sonictemplate'
Plug 'rodjek/vim-puppet'
Plug 'hashivim/vim-vagrant'
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'lambdalisue/fern-git-status.vim'

call plug#end()

" Fern
nnoremap fd :Fern . -reveal=%<CR>
nnoremap ff :Fern . -reveal=% -drawer -toggle -width=40<CR>
let g:fern#default_hidden=1

" Base16 Vim
let base16colorspace=256
colorscheme base16-tomorrow-night

" vim-terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" vim-lsp-settings
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    " nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    autocmd BufWritePre <buffer> LspDocumentFormatSync
endfunction
augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
let g:lsp_diagnostics_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0

" fzf
let $FZF_DEFAULT_OPTS="--layout=reverse"
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>G :GFiles?<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>r :Rg<CR>
