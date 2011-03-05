""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Import external source
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set nocompatible " get out of horrible vi-compatible mode
    filetype on " detect the type of file
    set history=100 " How many lines of history to remember
    set ffs=dos,unix,mac " support all three, in this order
    filetype plugin indent on " load filetype plugins
    set viminfo+=! " make sure it can save viminfo
    set isk+=_,$,@,%,#,- " none of these should be word dividers, so make them not be
    set wrap
    
    if version > 603
		set helplang=cn " set the language of help file
	endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " File encode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set encoding=utf-8
    set fileencodings=utf-8,chinese,gbk,gb2312,cp936
	set encoding=utf-8

	if has("win32")
		if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
			set ambiwidth=double
		endif
		set fileencoding=chinese
		set langmenu=zh_CN
		let $LANG = 'zh_CN.UTF-8'
		source $VIMRUNTIME/delmenu.vim
		source $VIMRUNTIME/menu.vim
		language messages zh_CN.utf-8
	else
		set fileencoding=utf-8
	endif
    
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Theme/Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set background=dark " we are using a dark background
    syntax on " syntax highlighting on
    "colorscheme desert " my theme for gui
    colorscheme evening " my theme for terminal

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Files/Backups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set nobackup " make backup file
    set makeef=error.err " When using make, where should it dump the file

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Vim UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set wildmenu " turn on wild menu
    set ruler " Always show current positions along the bottom 
    set cmdheight=1 " the command bar is 1 high
    set number " turn on line numbers
    set numberwidth=4 " minimum width to use for the number column,not a fix size
    set hid " you can change buffer without saving
    set backspace=2 " make backspace work normal
    set whichwrap+=<,>,h,l  " backspace and cursor keys wrap to
    set mouse=a " use mouse everywhere
    set shortmess=atI " shortens messages to avoid 'press a key' prompt 
    set report=0 " tell us when anything is changed via :...
    set lz " do not redraw while running macros (much faster) (LazyRedraw)
    
    " make the splitters between windows be blank
    set fillchars=vert:\ ,stl:\ ,stlnc:\
    set lsp=0 " space it out a little more (easier to read)
	
	" Font settings
	if has("win32")
    	set guifont=Monaco:h11:cANSI
    	set guifontwide=Yahei_Mono:h11:cGB2312
	elseif has("unix")
		set guifont=Monaco\ 12
		set guifontwide=WenQuanYi\ Micro\ Hei\ 12
	endif
	
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Visual Cues
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set showmatch " show matching brackets
    set hlsearch " do highlight searched for phrases
    set incsearch " BUT do highlight as you type you search phrase
    set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ " what to show when I hit :set list
    set so=15 " Keep 10 lines (top/bottom) for scope
    set novisualbell " don't blink
    set noerrorbells " no noises
    set laststatus=2 " always show the status line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Text Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set formatoptions+=mM " for charactors fold and patch
    set ai " autoindent
    set si " smartindent 
    set cindent " do c-style indenting
    set tabstop=4 " tab spacing (settings below are just to unify it)
    set softtabstop=4 " unify
    set shiftwidth=4 " unify 
    set noexpandtab " real tabs please!
    set wrap "  wrap lines  自动换行
    set smarttab " use tabs at the start of a line, spaces elsewhere

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Folding
    " Enable folding, but by default make it act like folding is off, because folding is annoying in anything but a few rare cases
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set foldenable " Turn on folding
    set foldlevel=100 " Don't autofold anything (but I can still fold manually)
    set foldopen-=search " don't open folds when you search into them
    set foldopen-=undo " don't open folds when you undo stuff

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " File Explorer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " let g:explVertical=1 " should I split verticially
	" let g:explWinSize=35 " width of 35 pixels

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Win Manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" let g:winManagerWidth=35 " How wide should it be( pixels)
	" let g:winManagerWindowLayout = 'FileExplorer|TagList' " What windows should it
	" 设置切换快捷键
	" nmap wm :WMToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " CTags and Taglist
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let Tlist_Ctags_Cmd = "/usr/bin/ctags-exuberant" " Location of my ctags
    let Tlist_Sort_Type = "name" " order by 
    let Tlist_Use_Right_Window = 0 " split to the left side of the screen
    let Tlist_Compart_Format = 1 " show small meny
    let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
    let Tlist_File_Fold_Auto_Close = 0 " Do not close tags for other files
    let Tlist_Enable_Fold_Column = 0 " Do not show folding tree
	let Tlist_Show_One_File=1

	" 设置ctags所生成tag文件的存放路径
    set tags=./tags,./../tags,./../../tags,./../../../tags,./../../../../tags,./**/tags,tags " which tags files CTRL-] will search
    set autochdir " auto change the current dierctory when you open the file or window or any other buffer
    set makeef=makeerror.err
    set path=.,./../**,/usr/include/*,,

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Minibuf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
    let g:miniBufExplModSelTarget = 1
	let g:miniBufExplMapCTabSwitchBufs = 1
	let g:miniBufExplMapWindowNavVim = 1
	let g:miniBufExplorerMoreThanOne = 0

	" 重新映射缓存标签切换快捷键
	nmap gt :MBEbn<cr>
	nmap gT :MBEbp<cr>
	
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Matchit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    
	let b:match_ignorecase = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Mappings,I don't need any mapping now
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "map <right> <ESC>:MBEbn<RETURN> " right arrow (normal mode) switches buffers  (excluding minibuf)
    "map <left> <ESC>:MBEbp<RETURN> " left arrow (normal mode) switches buffers (excluding minibuf) 
    "map <up> <ESC>:Sex<RETURN><ESC><C-W><C-W> " up arrow (normal mode) brings up a file list
    "map <down> <ESC>:Tlist<RETURN> " down arrow  (normal mode) brings up the tag list
    "map <A-i> i <ESC>r " alt-i (normal mode) inserts a single char, and then switches back to normal
    "map <F2> <ESC>ggVG:call SuperRetab()<left>
    "map <F12> ggVGg? " encypt the file (toggle)
	
	" 重映射保存快捷方式为熟悉的Ctrl+s
	map <C-s> <ESC>:w<cr>
	inoremap <C-s> <ESC>:w<cr><insert>

	" 重映射插入状态下光标的导航键
	imap <A-j> <down>
	imap <A-k> <up>
	imap <A-l> <right>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
    "autocmd GUIEnter * :simalt ~x -- " having it auto maximize the screen
    au BufEnter /usr/include/c++/*   setf cpp " all the file under the directory are recognized as cpp files by vim

    "if there are any error space(the end of line or before the tabs) in c/c++ code,highlight it
    "if $VIM_HATE_SPACE_ERRORS != '0'
            "let c_space_errors=1
    "endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Useful abbrevs, I don't need any iab now
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "iab xasp <%@language=jscript%><CR><%<CR><TAB><CR><BS>%><ESC><<O<TAB>
    "iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
    
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" Omni Completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	set completeopt=longest,menu

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " DoxygenToolkit plugin setting 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	map fg :Dox<cr>
	let g:DoxygenToolkit_authorName="Troy Huang"
	let g:DoxygenToolkit_briefTag_pre="@brief\t"
	let g:DoxygenToolkit_paramTag_pre="@param\t"
	let g:DoxygenToolkit_returnTag="@return\t"
	let g:DoxygenToolkit_briefTag_funName = "no"

