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
Plug 'chriskempson/base16-vim'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" Defx
nnoremap fd :Defx<CR>
call defx#custom#option('_', {
    \ 'show_ignored_files': 1,
    \ 'resume': 1,
    \ 'toggle': 1,
    \ })
autocmd FileType defx call s:defx_mappings()
function! s:defx_mappings() abort
    nnoremap <silent><buffer><expr> <CR>
    \ defx#is_directory() ?
    \ defx#do_action('open_tree', 'toggle') :
    \ defx#do_action('open')
    nnoremap <silent><buffer><expr> c
    \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
    \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
    \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> l
    \ defx#is_directory() ?
    \ defx#do_action('open_tree') :
    \ defx#do_action('open')
    nnoremap <silent><buffer><expr> T
    \ defx#do_action('open','tabnew')
    nnoremap <silent><buffer><expr> V
    \ defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> X
    \ defx#do_action('open', 'split')
    nnoremap <silent><buffer><expr> P
    \ defx#do_action('preview')
    nnoremap <silent><buffer><expr> o
    \ defx#do_action('open_tree', 'toggle')
    nnoremap <silent><buffer><expr> K
    \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
    \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M
    \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C
    \ defx#do_action('toggle_columns',
    \                'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S
    \ defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d
    \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
    \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> !
    \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
    \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
    \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
    \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;
    \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h
    \ defx#do_action('close_tree')
    nnoremap <silent><buffer><expr> ~
    \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
    \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
    \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
    \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
    \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
    \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
    \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
    \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
    \ defx#do_action('change_vim_cwd')
endfunction
autocmd BufWritePost * call defx#redraw()
autocmd BufEnter * call defx#redraw()

" Base16 Vim
let base16colorspace=256
colorscheme base16-default-dark

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
