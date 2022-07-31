call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'neovim/nvim-lspconfig'

call plug#end()


let g:gruvbox_contrast_dark='soft'
let g:gruvbox_contrast_light='soft'
let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ }


set termguicolors

colorscheme gruvbox
set background=dark
hi Normal ctermbg=NONE guibg=NONE

"set cursorline
"hi CursorLine ctermbg=NONE guibg=NONE

set relativenumber

set tabstop=4
set shiftwidth=4
set expandtab


:lua require('lsp')
"luafile C:\Users\ZCF\AppData\Local\nvim\lua\lsp.lua
