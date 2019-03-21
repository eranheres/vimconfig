let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plug 'jnurmine/Zenburn'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'majutsushi/tagbar'
Plug 'davidhalter/jedi-vim'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'rosenfeld/conque-term'
Plug 't9md/vim-choosewin'
Plug 'vim-vdebug/vdebug'
Plug 'scrooloose/nerdcommenter'
Plug 'skywind3000/asyncrun.vim'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'Shougo/echodoc.vim'
Plug 'Raimondi/delimitMate'
"Plug 'Townk/vim-autoclose'

call plug#end()

filetype plugin indent on    " required


" Operation -------------------------------
"------------------------------------------
" Specify where splits are being opened
set splitbelow
set splitright
let mapleader = ',' " remap leader
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with spacebar
nnoremap <space> za
set clipboard=unnamed " Enable system clipboard access
nmap <tab> <c-w>w 
" save as sudo
ca w!! w !sudo tee "%"
" help in vertical mode
map <f1> :vert help<CR> :vertical resize 80<CR> :set wfw<CR>
" page up and down faster navigation
map <C-J> <C-D>
map <C-K> <C-U>
" scroll through selection
imap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-J>"
imap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-K>"
" allow switching between windows without saving the buffergator
set hidden
" search case sensitive with smart case 
set ignorecase
set smartcase 

" Styling ---------------------------------
"------------------------------------------
syntax on " turn syntax coloring on
set cursorline
hi CursorLine gui=underline cterm=underline
set nu    " set line numbers
" Tab and text width for python files
au BufNewFile,BufRead *.py 
     \ set tabstop=4 |
     \ set softtabstop=4 |
     \ set shiftwidth=4 |
     \ set textwidth=79 |
     \ set expandtab |
     \ set autoindent |
     \ set fileformat=unix
" Set colorscheme for terminal and GUI modes
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
" Tab and text width for full stack types files 
au BufNewFile,BufRead *.js, *.html, *.css
     \ set tabstop=2 |
     \ set softtabstop=2 |
     \ set shiftwidth=2
" split navigation
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>
" incremental search
set incsearch
" highlighted search results
set hlsearch
" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3
" cursor style
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


" ============================================================================
" Plugins settings and mappings

" Simply fold plugin -----------------
let g:SimpylFold_docstring_preview=1

" AutoCompleteMe plugin -------------
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
set encoding=utf-8

" NERDTree plugin -------------------
" don;t show these file types
let NERDTreeIgnore=['\.pyc$', '\~$', '\.pyo$'] 
" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" fix cursor problem
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
" adjust default win size 
let g:NERDTreeWinSize=30
let g:NERDTreeNodeDelimiter = "\u00a0"
" quit on open a file
" let NERDTreeQuitOnOpen=1

" CtrlP ------------------------------
" file finder mapping
let g:ctrlp_map = ',e'
" tags (symbols) in current file finder mapping
nmap ,g :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
nmap ,G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap ,f :CtrlPLine<CR>
" recent files finder mapping
nmap ,m :CtrlPMRUFiles<CR>
" commands finder mapping
nmap ,c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" same as previous mappings, but calling with current word as default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

" Syntastic ------------------------------

" show list of errors and warnings on the current file
"nmap <leader>e :Errors<CR>
" check also when just opened the file
"let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
"let g:syntastic_enable_signs = 0
" custom icons (enable them if you use a patched font, and enable the previous 
" setting)
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_style_error_symbol = '✗'
"let g:syntastic_style_warning_symbol = '⚠'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Window Chooser ------------------------------

" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" ConqueTerm plugin ---------------------------
map <F2> :ConqueTermSplit bash<CR>

" VDebug plugin ---------------------------
" remap F-5 key so it will open the remote python when executing
function! Debug_vdebug(...)
    :w
    :VdebugStart
    :exec ':AsyncRun python -S ~/.vim/komodo-python/pydbgp -d localhost:9000 % '.join(a:000)
endfunction
noremap <leader>a :exec Debug_vdebug()<CR>
set autoread
au CursorHold *.py checktime 
