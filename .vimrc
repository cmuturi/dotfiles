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
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

colorscheme bliss
set number
set relativenumber
set foldcolumn=0
let mapleader="-"

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
inoremap <C-x> <Del>

" Indent selected text by pressing tab key
vmap <tab> >gv
" un-indent selected text by pressing shift + tab key
vmap <s-tab> <gv

" Tagbar"
map f8 :TagbarToggle<CR>

" ====> FZF-vim Settings
nnoremap <C-p> :Files<Cr>
nnoremap <a-T> :BTags<Cr>
nnoremap <a-t> :Tags<Cr>
nnoremap <a-f> :Rg<Cr>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ====> coc Settings Start
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Remap keys for gotos
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>r <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <leader>k :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Format selected
vmap <leader>s  <Plug>(coc-format-selected)
nmap <leader>s  <Plug>(coc-format-selected)
" Show yank history
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" <coc-snippet> settings
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

" <coc-prettier>
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" <coc-explorer> settings
nmap <space>e :CocCommand explorer<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ====> coc Settings End
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
