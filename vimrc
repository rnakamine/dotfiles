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
set clipboard=unnamed,autoselect
set shortmess-=S
set laststatus=2
set ruler
set splitbelow
set splitright

if has('vim_starting')
    let &t_SI .= "\e[6 q"
    let &t_EI .= "\e[2 q"
    let &t_SR .= "\e[4 q"
endif

if has("autocmd")
    autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
endif

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-commentary'
Plug 'mattn/vim-sonictemplate'
Plug 'rodjek/vim-puppet'
Plug 'hashivim/vim-vagrant'
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'jacoborus/tender.vim'

call plug#end()

" Theme
syntax enable
colorscheme tender

" vim-terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" vimfiler
let g:vimfiler_as_default_explorer = 1
nnoremap fd :VimFilerBufferDir <CR>
nnoremap fe :VimFilerExplorer -winwidth=50 -toggle<CR>

" vim-lsp
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
