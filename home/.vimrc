set nocompatible
set showmatch
set ignorecase
set mouse=nv
set hlsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set nu rnu
set wildmode=longest, list
set cc=90
set nobackup
set noswapfile
set noundofile
set nolist
set encoding=utf-8
set colorcolumn=110
set splitright
hi ColorColumn ctermbg=darkgray
" TextEdit might fail if hidden is not set.
set hidden
"
" Some servers have issues with backup files, see #649.
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
"
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
"
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
set signcolumn=number
	else
set signcolumn=yes
	endif

let mapleader = '\'

autocmd FileType cpp noremap <F5> :w<CR> :!g++ -Wall -O2 % -o test && time ./test<CR>
autocmd FileType cpp noremap <C-F5> :w<CR> :!g++ -Wall -O2 % -o test<CR>

autocmd FileType pascal noremap <F5> :w<CR> :!fpc % && echo -e "\n\n\nProgram started...\n" && time ./test<CR>
autocmd FileType pascal noremap <C-F5> :w<CR> :!fpc %<CR>

autocmd FileType javascript noremap <F5> :w<CR> :!node %<CR>

autocmd FileType python noremap <F5> :w<CR> :!python3 %<CR>

inoremap jj <Esc>
nnoremap <leader>s :update<CR>

filetype plugin indent on
syntax on

call plug#begin("~/.vim/plugged")

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'tomasiser/vim-code-dark'
Plug 'preservim/nerdcommenter'

call plug#end()

map <C-n> :NERDTreeToggle<CR>

set t_Co=256
set t_ut=
colorscheme codedark

hi IncSearch ctermbg=darkcyan guibg=darkcyan ctermfg=black guifg=black
hi LineNr ctermfg=grey ctermbg=black guifg=grey guibg=black

" set foldcolumn=5

" vim-nerdtree-syntax-highlight
" highlight fullname (not only icons)
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule

let g:NERDTreeLimitedSyntax = 1


" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

