call plug#begin()
	Plug 'cmuturi/bliss'
	Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'Yggdroot/indentLine'
	Plug 'pearofducks/ansible-vim'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'tpope/vim-commentary'
	Plug 'mhinz/vim-startify'

call plug#end()

colorscheme bliss
syntax on
set number
set relativenumber
set foldcolumn=0

" Split window nav
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Quick escape
inoremap jk <Esc>
inoremap kj <Esc>
cnoremap jk <Esc>
cnoremap kj <Esc>

" Forward delete
inoremap <C-l> <Del>

" Indent selected text by pressing tab key
vmap <tab> >gv
" un-indent selected text by pressing shift + tab key
vmap <s-tab> <gv

" Tagbar"
map <f8> :TagbarToggle<CR>

let g:indentLine_color_term = 239

" Pearofducks
let g:ansible_unindent_after_newline = 1
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1

if has('persistent_undo')
    " Maintain undo history between sessions
    set undofile
    set undodir=~/.vim/undodir
endif
