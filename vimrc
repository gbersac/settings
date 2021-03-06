
set autoread

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin vbundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"list of plugin
" ide plugins
Bundle 'ctrlp.vim'
Bundle 'Syntastic'
Bundle 'mhinz/vim-signify'
Bundle 'tpope/vim-fugitive'
Bundle 'tComment'
"Bundle 'surround.vim'
"Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Bundle 'Auto-Pairs'

" misc plugins
Bundle 'bling/vim-airline'
Bundle 'AutoComplPop'
"Bundle 'vim-scripts/hexman.vim'

" filetype plugins
Bundle 'nginx.vim'
Bundle 'plasticboy/vim-markdown'
Plugin 'derekwyatt/vim-scala'

" c/c++ header easy
Bundle "aperezdc/vim-template"

"multi cursor
Bundle "terryma/vim-multiple-cursors"

" language support
Bundle "wting/rust.vim"
Bundle 'fatih/vim-go'
Bundle 'cespare/vim-toml'

"end of vbundle
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"settings
syn on
set nu
set mouse=a
set cursorline
set backspace=2
set paste

" Associate file extension with synthax
au BufNewFile,BufRead *.s setlocal ft=nasm

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set noet ci pi sts=0 sw=4 ts=4

autocmd BufWritePre * :%s/\s\+$//e " trim trailing whitespace on save

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*.o,*.pdf 
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ultisnip Plugin
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin priority
let g:signify_sign_overwrite = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar plugin options
nmap <F8> :TagbarToggle<CR>

let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \]
    \}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
" c
let g:syntastic_c_compiler_options	= " -Wall -Wextra -Werror "
let g:syntastic_c_compiler			= "clang"
let g:syntastic_c_include_dirs		= ["inc", '../inc']

" c++
let g:syntastic_cpp_compiler			= "clang"
let g:syntastic_cpp_compiler_options	= " -Wall -Wextra -Werror "
let g:syntastic_cpp_include_dirs		= ["inc", '../inc']

