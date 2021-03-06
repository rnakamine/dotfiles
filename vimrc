" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'Shougo/unite.vim'
Plug 'shougo/vimfiler.vim'
Plug 'hashivim/vim-terraform'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-commentary'
Plug 'chriskempson/base16-vim'

call plug#end()

" basic configuration
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

if has('vim_starting')
    let &t_SI .= "\e[6 q"
    let &t_EI .= "\e[2 q"
    let &t_SR .= "\e[4 q"
endif

if has("autocmd")
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
endif

" Base16-Vim
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif

" status line
set laststatus=2
set statusline=%f\ %m%=\ %{&fileencoding?&fileencoding:&encoding}\ \|\ %{&ft}\ \|\ %{&fileformat}\ \|\ %3l:%-3c\ \|\ %3p%%\ 

" Makefile
let _curfile=expand("%:r")
if _curfile == 'Makefile'
    set noexpandtab
endif

" Terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" VimFiler
let g:vimfiler_as_default_explorer=1

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
