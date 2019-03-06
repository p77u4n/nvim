" Combining amix vimrc and adding some additional configuration stuff for my own purposes
" Fugitive is suck
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/extended.vim

" Section General {{{

" Abbreviations
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter
abbr cosnt const
abbr attribtue attribute
abbr attribuet attribute

set nocompatible            " not compatible with vi
set autoread                " detect when a file is changed

filetype on
filetype plugin on
filetype indent on

set re=1 "disable new engin:

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

set history=1000            " change history to 1000

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

if (has('nvim'))
    " show results of substition as they're happening
    " but don't open a split
    set inccommand=nosplit
endif

" }}}
"
"

" Section User Interface {{{

syntax on
set t_Co=256                " Explicitly tell vim that the terminal supports 256 colors"

" switch cursor to line when in insert mode, and block when not
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
	    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
	    \,sm:block-blinkwait175-blinkoff150-blinkon175

if &term =~ '256color'
    " disable background color erase
    set t_ut=
endif

" enable 24 bit color support if supported
if (has('mac') && empty($TMUX) && has("termguicolors"))
    set termguicolors
endif

if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
else
    " let g:solarized_termcolors=256
    colorscheme gruvbox 
    " colorscheme solarized
endif

set background=dark
" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set guifont=Fira\ Mono\ Medium\ 22
" Use Unix as the standard file type
set ffs=unix,dos,mac

" make the highlighting of tabs and other non-text less annoying
highlight SpecialKey ctermfg=236
highlight NonText ctermfg=236

" make comments and HTML attributes italic
highlight Comment cterm=italic
highlight htmlArg cterm=italic
highlight xmlAttrib cterm=italic
highlight Type cterm=italic
highlight Normal ctermbg=none

"Vim hybrid relative numbering
:set number relativenumber
"Auto switch to absolute line number while switch to insert mode
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

set wrap                    " turn on line wrapping
set textwidth=80
set wrapmargin=8            " wrap lines when coming within n characters from side
set linebreak               " set soft wrapping
set showbreak=…             " show ellipsis at breaking

set autoindent              " automatically set indent of new line
set smartindent

" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" make backspace behave in a sane manner
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
" Tab control
"set noexpandtab             " insert tabs rather than spaces for <Tab>
set expandtab
set smarttab                " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=2               " the visible width of tabs
set softtabstop=2           " edit as if the tabs are 4 characters wide
set shiftwidth=2            " number of spaces to use for indent and unindent
set shiftround              " round indent to a multiple of 'shiftwidth'
set completeopt+=longest

" code folding settings
set foldmethod=indent		" fold based on indent
set foldlevelstart=99
set foldnestmax=10          " deepest fold is 10 levels
set nofoldenable            " don't fold by default
set foldlevel=1

augroup javascript_folding
		au!
		au FileType javascript setlocal foldmethod=syntax
augroup END

set clipboard=unnamed

set ttyfast                 " faster redrawing
set diffopt+=vertical
set laststatus=2            " show the satus line all the time
set so=7                    " set 7 lines to the cursors - when moving vertical
set wildmenu                " enhanced command line completion

set ruler					"Always show current position
set wildignore=*.o,*~,*.pyc " ignore compiled files
set hidden                  " current buffer can be put into background
set showcmd                 " show incomplete commands
set noshowmode              " don't show which mode disabled for PowerLine
set wildmode=list:longest   " complete files like a shell
set scrolloff=3             " lines of text around cursor
set shell=$SHELL
set cmdheight=1             " command bar height
set title                   " set terminal title

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers
set nolazyredraw            " don't redraw while executing macros

set magic                   " Set magic on, for regex

set showmatch               " show matching braces
set mat=2                   " how many tenths of a second to blink

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500
set colorcolumn=80

if has('mouse')
		set mouse=a
		" set ttymouse=xterm2
endif

" }}}

" Section Mappings {{{

" set a map leader for more key combos
let mapleader = ','

" remap esc
inoremap jk <esc>

" wipout buffer
nmap <silent> <leader>b :bw<cr>

" shortcut to save
nmap <leader>, :w<cr>

" set paste toggle
set pastetoggle=<leader>v

" toggle paste mode
" map <leader>v :set paste!<cr>

" edit ~/.config/nvim/init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<cr>
" edit gitconfig
map <leader>eg :e! ~/.gitconfig<cr>

" activate spell-checking alternatives
nmap ;s :set invspell spelllang=en<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" markdown to html
nmap <leader>md :%!markdown --html4tags <cr>

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>
nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>

nmap <leader>l :set list!<cr>

" Textmate style indentation
vmap <leader>[ <gv
vmap <leader>] >gv
nmap <leader>[ <<
nmap <leader>] >>


" switch between current and last buffer
nmap <leader>. <c-^>

" delete but not cut
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

" enable . command in visual mode
vnoremap . :normal .<cr>

nmap <silent> <C-h> :call functions#WinMove('h')<cr>
nmap <silent> <C-j> :call functions#WinMove('j')<cr>
nmap <silent> <C-k> :call functions#WinMove('k')<cr>
nmap <silent> <C-l> :call functions#WinMove('l')<cr>

map <leader>wc :wincmd q<cr>
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac

nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" move line mappings
" ∆ is <A-j> on macOS
" ˚ is <A-k> on macOS
nnoremap ∆ :m .+1<cr>==
nnoremap ˚ :m .-2<cr>==
inoremap ∆ <Esc>:m .+1<cr>==gi
inoremap ˚ <Esc>:m .-2<cr>==gi
vnoremap ∆ :m '>+1<cr>gv=gv
vnoremap ˚ :m '<-2<cr>gv=gv

" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>

" inoremap <tab> <c-r>=Smart_TabComplete()<CR>

map <leader>r :call RunCustomCommand()<cr>
" map <leader>s :call SetCustomCommand()<cr>
let g:silent_custom_command = 0

" helpers for dealing with other people's code
nmap \t :set ts=2 sts=2 sw=2 noet<cr>
nmap \s :set ts=2 sts=2 sw=2 et<cr>

nnoremap <silent> <leader>u :call functions#HtmlUnEscape()<cr>

command! Rm call functions#Delete()
command! RM call functions#Delete() <Bar> q!

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call functions#VisualSelection('f')<CR>
vnoremap <silent> # :call functions#VisualSelection('b')<CR>

" }}}

"""""""""" Section Moving around, tabs, windows and buffer{{{

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Useful mappings for resize split
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>> :exe "resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>< :exe "resize " . (winwidth(0) * 2/3)<CR>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

set viminfo^=%

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
"  }}}


"""""""""""""""" Copy File Path Utilities - https://stackoverflow.com/a/17096082 {{{
" copy current file name (relative/absolute) to system clipboard
if has("mac") || has("gui_macvim") || has("gui_mac")
  " relative path  (src/foo.txt)
  nnoremap <leader>cfr :let @*=expand("%")<CR>

  " absolute path  (/something/src/foo.txt)
  nnoremap <leader>cfa :let @*=expand("%:p")<CR>

  " filename       (foo.txt)
  nnoremap <leader>cff :let @*=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>cfd :let @*=expand("%:p:h")<CR>
endif

" copy current file name (relative/absolute) to system clipboard (Linux version)
if has("gui_gtk") || has("gui_gtk2") || has("gui_gnome") || has("unix")
  " relative path (src/foo.txt)
  nnoremap <leader>cfr :let @+=expand("%")<CR>

  " absolute path (/something/src/foo.txt)
  nnoremap <leader>cfa :let @+=expand("%:p")<CR>

  " filename (foo.txt)
  nnoremap <leader>cff :let @+=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>cfd :let @+=expand("%:p:h")<CR>
endif
"  }}}

"""""""""""""""" Section AutoGroups {{{
" file type specific settings
augroup configgroup
    autocmd!

    " automatically resize panes on resize
    autocmd VimResized * exe 'normal! \<c-w>='
    autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
    autocmd BufWritePost .vimrc.local source %
    " save all files on focus lost, ignoring warnings about untitled buffers
    autocmd FocusLost * silent! wa

    " make quickfix windows take all the lower section of the screen
    " when there are multiple windows open
    autocmd FileType qf wincmd J

    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']

    " autocmd! BufEnter * call functions#ApplyLocalSettings(expand('<afile>:p:h'))

    autocmd BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
augroup END

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
	    \ if line("'\"") > 0 && line("'\"") <= line("$") |
	    \   exe "normal! g`\"" |
	    \ endif

" }}}

" Section Plugins {{{

" FZF
"""""""""""""""""""""""""""""""""""""
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>:NERDTreeMirrorOpen<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_console_startup=1
map <Leader>n <plug>NERDTreeTabsToggle<CR>
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'

" FZF
let g:fzf_layout = { 'down': '~25%' }

if isdirectory(".git")
    " if in a git project, use :GFiles
    nmap <silent> <leader>t :GFiles --cached --others --exclude-standard<cr>
else
    " otherwise, use :FZF
    nmap <silent> <leader>t :FZF<cr>
endif

nmap <silent> <leader>r :Buffers<cr>
nmap <silent> <leader>e :FZF<cr>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

"imap <c-y>A <plug>(emmet-anchorize-summary)
"imap <c-y>a <plug>(emmet-anchorize-url)
"imap <c-y>k <plug>(emmet-remove-tag)
"imap <c-y>j <plug>(emmet-split-join-tag)
"imap <c-y>/ <plug>(emmet-toggle-comment)
"imap <c-y>i <plug>(emmet-image-size)
"imap <c-y>N <plug>(emmet-move-prev)
"imap <c-y>n <plug>(emmet-move-next)
"imap <c-y>D <plug>(emmet-balance-tag-outword)
"imap <c-y>d <plug>(emmet-balance-tag-inward)
"imap <c-y>u <plug>(emmet-update-tag)
"imap <c-y>; <plug>(emmet-expand-word)
"imap <c-y>, <plug>(emmet-expand-abbr)
nnoremap <silent> <Leader>C :call fzf#run({
	    \   'source':
	    \     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
	    \         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
	    \   'sink':    'colo',
	    \   'options': '+m',
	    \   'left':    30
	    \ })<CR>

command! -bang -nargs=* Find call fzf#vim#grep(
	    \ 'rg --column --line-number --no-heading --follow --color=always '.<q-args>, 1,
	    \ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

" Emmet
"""""""""""""""""""""""""""""""""""""
let g:user_emmet_settings = {
	    \  'javascript.jsx': {
	    \      'extends': 'jsx',
	    \  },
	    \}

" Fugitive Shortcuts
"""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

nmap <leader>m :MarkedOpen!<cr>
nmap <leader>mq :MarkedQuit<cr>
nmap <leader>* *<c-o>:%s///gn<cr>

let g:ale_change_sign_column_color = 1
" Enable completion where available.
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign

let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linters = {
	    \   'javascript': ['eslint'],
	    \	'jsx' : ['stylelint', 'eslint'],
	    \   'typescript': ['tslint', 'tsserver'],
	    \	'css': ['prettier'],
	    \	'html': []
	    \}
let g:ale_fixers = {
	    \   'javascript': ['eslint'],
      \	'jsx': ['eslint'],
	    \	'css': ['prettier']
	    \}
" airline options
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1 " enable airline tabline
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2 " only show tabline if tabs are being used (more than 1 tab open)
let g:airline#extensions#tabline#show_buffers = 0 " do not show open buffers in tabline
let g:airline#extensions#tabline#show_splits = 0

" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0

let g:SuperTabCrMapping = 0

"For clang

let g:clang_library_path='/usr/lib/llvm-3.5/lib/libclang.so.1'

"For vim-go




let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

"For SnipMate - changing the trigger to <Ctrl> + J instead of <TAB> to
"prevent a clash with the YouCompleteme

"imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
"smap <C-J> <Plug>snipMateNextOrTrigger

"FOR VIM-JAVASCRIPT
let g:javascript_enable_domhtmlcss = 1

"For select all document
map <C-a> <esc>ggVG<CR>

"For vim-autoformat
noremap <F3> :Autoformat<CR>
let g:autoformat_verbosemode=1
let g:formatdef_js_beautify='"js-beautify"'
let g:formatdef_eslint='"eslint"'
let g:formatdef_html_beautify='"html-beautify"'
let g:formatters_jsx=['js_beautify', 'eslint', 'html-beautify']
let g:formatters_javascript_jsx=['js_beautify', 'eslint', 'html_beautify']
" }}}

" vim:foldmethod=marker:foldlevel=0

" For Vim javascript-libraries-syntax

autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
autocmd BufReadPre *.js let b:javascript_lib_use_reactjs = 1
autocmd BufReadPre *.js let b:javascript_lib_use_ramda = 1

autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 0

" for vim utilsnip to reconcile with youcompleme tab

let g:UltiSnipsExpandTrigger="<C-J>"

"for vim-easytags
  
let g:easytags_async = 1
let g:easytags_auto_update = 0
"for vim commentary
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:deoplete#enable_at_startup = 1

" for import js
nmap <leader>f :ImportJSFix<cr>

let g:tagbar_ctags_bin='/usr/local/bin/ctags'
nmap <F8> :TagbarToggle<CR>
let g:tern_map_keys=1
let g:tern_map_prefix='\'
" for carbon now sh
vnoremap <F5> :CarbonNowSh<CR>
if (has('mac'))
  let g:carbon_now_sh_browser = "open -a 'Google Chrome'"
else
  let g:carbon_now_sh_browser = "open -a 'Google Chrome'"
endif
let g:carbon_now_sh_options =
\ { 'ln': 'true',
  \ 'fm': 'Source Code Pro' }
