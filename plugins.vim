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
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'arcticicestudio/nord-vim'
" utilities
"Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
"Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'mileszs/ack.vim' " search inside files using ack. Same as command line ack utility, but use :Ack
"Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - ehances surround
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'benmills/vimux' " tmux integration for vim
Plug 'vim-airline/vim-airline' " Fancy status line
Plug 'vim-airline/vim-airline-themes' " Theme for vim airline
" Plug 'w0rp/ale' " Asynchonous linting engine
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-rhubarb' " hub extension for fugitive
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'editorconfig/editorconfig-vim' " .editorconfig support
Plug 'MarcWeber/vim-addon-mw-utils' " interpret a file by function and cache file automatically
Plug 'tomtom/tlib_vim' " utility functions for vim .There isn't much need to install it unless another plugin requires you to do so.
Plug 'sotte/presenting.vim', { 'for': 'markdown' } " a simple tool for presenting slides in vim based on text files
Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher // ref : https://codeyarns.com/2015/03/28/dispatch-plugin-for-vim/
Plug 'tpope/vim-vinegar' " netrw helper - ref : http://codyveal.com/posts/vim-killer-features-part-2-file-navigation/
Plug 'AndrewRadev/splitjoin.vim' " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
Plug 'vim-scripts/matchit.zip' " extended % matching
Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
Plug 'sickill/vim-pasta' " context-aware pasting

Plug 'SirVer/ultisnips' " vim snippet
Plug 'honza/vim-snippets'

Plug 'Galooshi/vim-import-js'
" html / templates
Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript.jsx'] } " match tags in html, similar to paren support
Plug 'othree/html5.vim',  { 'for': ['html', 'javascript.jsx'] }" html5 support
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] } " pug / jade support
Plug 'mattn/emmet-vim'
" javascript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html', 'typescript.tsx'] }
"Plug 'mxw/vim-jsx'
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': 'javascript.jsx' } " very laggy dont use this
Plug 'moll/vim-node', { 'for': 'javascript' } " node support
"Typescript syntax highlighting
"
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jparise/vim-graphql'
" Plug 'HerringtonDarkholme/yats.vim' "very laggy
"Elm
"Plug 'lambdatoast/elm.vim', { 'for': 'elm' }

" CoffeeScript
Plug 'kchmck/vim-coffee-script'

"For react
Plug 'epilande/vim-react-snippets'
Plug 'https://github.com/wesQ3/vim-windowswap'

Plug 'groenewege/vim-less', { 'for': 'less' } " less support
" Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } " set the background of hex color values to the color
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support
Plug 'ap/vim-css-color', { 'for': ['scss', 'css'] } " css color hightlight support

" markdown
if has("mac") || has("gui_macvim") || has("gui_mac")
  Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " Open markdown files in Marked.app - mapped to <leader>m
endif

" styles
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" language-specific plugins
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " interactive command execution in vim
Plug 'fatih/vim-go', { 'for': 'go' } " go support
Plug 'timcharper/textile.vim', { 'for': 'textile' } " textile support
Plug 'vim-latex/vim-latex', { 'for' : 'tex'}
" general tool for languages
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'

" for tmux integration
Plug 'christoomey/vim-tmux-navigator'

"from old vimrc
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'matze/vim-move'

Plug 'chrisbra/NrrwRgn'


Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'liuchengxu/space-vim-dark'

Plug 'ryanoasis/vim-devicons'

" Moving around easier
Plug 'easymotion/vim-easymotion'

Plug 'majutsushi/tagbar'

Plug 'liuchengxu/vista.vim'

" Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'APZelos/blamer.nvim'

Plug 'neoclide/coc-denite'
if has('nvim')
	Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/denite.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'wakatime/vim-wakatime'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'rhysd/reply.vim', { 'on': ['Repl', 'ReplAuto'] }

call plug#end()
