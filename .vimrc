call plug#begin()
	Plug 'cmuturi/bliss'
	Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'Yggdroot/indentLine'
	Plug 'pearofducks/ansible-vim'

call plug#end()
set color bliss

let g:indentLine_color_term = 239

if has('persistent_undo')
    " Maintain undo history between sessions
    set undofile
    set undodir=~/.vim/undodir
endif
