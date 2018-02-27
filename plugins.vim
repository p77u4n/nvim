" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
	if executable('curl')
		let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
		call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
		if v:shell_error
			echom "Error downloading vim-plug. Please install it manually.\n"
			exit
		endif
	else
		echom "vim-plug not installed. Please install it manually or install curl.\n"
		exit
	endif
endif

call plug#begin('~/.config/nvim/plugged')


" colorschemes
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
" utilities
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim' " search inside files using ack. Same as command line ack utility, but use :Ack
"Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - ehances surround
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'benmills/vimux' " tmux integration for vim
Plug 'vim-airline/vim-airline' " Fancy status line
Plug 'vim-airline/vim-airline-themes' " Theme for vim airline
Plug 'w0rp/ale' " Asynchonous linting engine
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-rhubarb' " hub extension for fugitive
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'garbas/vim-snipmate' " snippet manager
Plug 'editorconfig/editorconfig-vim' " .editorconfig support
Plug 'MarcWeber/vim-addon-mw-utils' " interpret a file by function and cache file automatically
Plug 'editorconfig/editorconfig-vim' " .editorconfig support Plug 'MarcWeber/vim-addon-mw-utils'  interpret a file by function and cache file automatically
Plug 'tomtom/tlib_vim' " utility functions for vim .There isn't much need to install it unless another plugin requires you to do so.
Plug 'sotte/presenting.vim', { 'for': 'markdown' } " a simple tool for presenting slides in vim based on text files
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher // ref : https://codeyarns.com/2015/03/28/dispatch-plugin-for-vim/
Plug 'tpope/vim-vinegar' " netrw helper - ref : http://codyveal.com/posts/vim-killer-features-part-2-file-navigation/
Plug 'AndrewRadev/splitjoin.vim' " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
Plug 'vim-scripts/matchit.zip' " extended % matching
Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
Plug 'sickill/vim-pasta' " context-aware pasting

" html / templates
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript.jsx'] } " emmet support for vim - easily create markdup wth CSS-like syntax
Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript.jsx'] } " match tags in html, similar to paren support
Plug 'othree/html5.vim',  { 'for': ['html', 'javascript.jsx'] }" html5 support
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] } " pug / jade support

" javascript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html'] }
Plug 'moll/vim-node', { 'for': 'javascript' } " node support
Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript'] } " JSX support
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }

" TypeScript
Plug 'jason0x43/vim-tss', { 'for': ['typescript', 'javascript', 'javascript.jsx'], 'do': 'npm install' }
" Plug 'Quramy/tsuquyomi', { 'for': 'typescript', 'do': 'npm install' } " extended typescript support - works as a client for TSServer
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' } " typescript support

" Elm
Plug 'lambdatoast/elm.vim', { 'for': 'elm' }

" CoffeeScript
Plug 'kchmck/vim-coffee-script'

" styles
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } " markdown support
Plug 'groenewege/vim-less', { 'for': 'less' } " less support
" Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } " set the background of hex color values to the color
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support

" markdown
Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " Open markdown files in Marked.app - mapped to <leader>m
Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support

" language-specific plugins
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " interactive command execution in vim
Plug 'fatih/vim-go', { 'for': 'go' } " go support
Plug 'timcharper/textile.vim', { 'for': 'textile' } " textile support
Plug 'vim-latex/vim-latex', { 'for' : 'tex'}
" general tool for languages
Plug 'Chiel92/vim-autoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'

" for tmux integration
Plug 'christoomey/vim-tmux-navigator'

"from old vimrc
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'matze/vim-move'

call plug#end()
