
" >>>>
" 插件安装
source ~/.vim/bundles.vim
" <<<<

set helplang=cn 

" 定义快捷键的前缀，即 <Leader>
let mapleader=","

" >>
" 设置主题
set modelines=0

"设置更好的删除
set backspace=2 

syntax on "语法高亮
set selection=exclusive
set clipboard+=unnamed
"用浅色高亮当前行
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

set smartindent "智能对齐
set autoindent "自动对齐
set confirm "在处理未保存或只读文件的时候，弹出确认框

set tabstop=4 "tab键的宽度
set softtabstop=4
set shiftwidth=4 "统一缩进为4
set expandtab "不要用空格替代制表符

set number "显示行号
set history=100  "历史纪录数
set hlsearch
set incsearch "搜素高亮,搜索逐渐高亮

set ignorecase  " 搜索时大小写不敏感


au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
set smartcase
set gdefault "行内替换
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1 "编码设置

set guifont=Menlo:h16:cANSI "设置字体
set langmenu=zn_CN.UTF-8
set helplang=cn  "语言设置

set ruler "在编辑过程中，在右下角显示光标位置的状态行
set laststatus=1  "总是显示状态行

set showcmd "在状态行显示目前所执行的命令，未完成的指令片段也会显示出来

set scrolloff=3 "光标移动到buffer的顶部和底部时保持3行的距离
set showmatch "高亮显示对应的括号
set matchtime=5 "对应括号高亮时间(单位是十分之一秒)

"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
"nmap st: set list<cr>
set whichwrap=b,s,<,>,[,] "开启normal 或visual模式下的backspace键空格键，左右方向键,insert或replace模式下的左方向键，右方向键的跳行功能
" <<


" 配色方案
set termguicolors
set background=dark
"colorscheme desertEx
colorscheme neodark
"set t_Co=256   "256色
"set mouse=a  "允许鼠标
"colorscheme molokai
"colorscheme phd



" >>
" 文件类型侦测

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" <<
" >>
" vim 自身（非插件）快捷键
" 定义快捷键到行首和行尾

nmap LB 0
nmap LE $

" 设置快捷键将选中文本块复制至系统剪贴板
"vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
"nmap <Leader>p "+p

" 定义快捷键关闭当前分割窗口
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
"按,m取消高亮搜索结果
nmap <silent> <leader>m :nohlsearch<CR>

" 设置快捷键遍历子窗口
" 依次遍历
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap lw <C-W>l
" 跳转至方的窗口
nnoremap hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j

nmap bn :bNext<cr>
nmap bp :bprevious<cr>
" 定义快捷键在结对符之间跳转
nmap <Leader>M %

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" <<

" >>
" 其他

" 开启实时搜索功能
"set incsearch

map <space> /
map <c-space> ?
"map <leader>bd:Bclose

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction
" vim 自身命令行模式智能补全
set wildmenu

" <<


" >>> config ycm

let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/ycm/cpp/.ycm_extra_conf.py'
" 禁用syntastic来对python检查
let g:syntastic_ignore_files=[".*\.py$","*.o"]
" 使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1
nnoremap <leader>lo :lopen<CR> "open locationlist                                                                                                                      
nnoremap <leader>lc :lclose<CR>   "close locationlist
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
autocmd Filetype python,c,cpp,Java,vim nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
map <F9> :YcmDiags<cr>
" <<<
"
" >>> config nerdtree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeWinPos = "right"
let NERDTreeQuitOnOpen=1 "打开文件时关闭树
let NERDTreeShowBookmarks=1 "显示书签
map ne :NERDTreeToggle<CR>
"map <leader>tl :TlistToggle<cr>
"nnoremap <leader>ma :set mouse=a<cr>
"nnoremap <leader>mu :set mouse=<cr>
" <<<

" >>> config tagbar
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
nmap tb :TagbarToggle<CR>
" <<<


" >>> config tabbar
let g:Tb_MaxSize = 2
let g:Tb_TabWrap = 1

hi Tb_Normal guifg=white ctermfg=white
hi Tb_Changed guifg=green ctermfg=green
hi Tb_VisibleNormal ctermbg=252 ctermfg=235
hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white
" <<< 
" >>> config taglist
let Tlist_Use_Left_Window=1 "taglist 显示在左侧 
let Tlist_Exit_OnlyWindow=1 "taglist 只剩下一个窗口时，自动关闭
let Tlist_File_Fold_Auto_Close=1
map tl :TlistToggle<CR>
" <<<
" >>>nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

map <leader>cc NERDComComment "注释
map <leader>cu NERDComUncommentLine "取消注释
map<leader>cm NERDComSexyComment "注释代码块

map <F6> <leader>cm
map <F7> <leader>cu
map <c-z> u
" <<<
" >>> condig syntax
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"<<<
"let g:Powerline_symbols = 'fancy'
">>>

" <<<
" config ctrlp
set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
" >>>
" >>> config  markdown
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
" <<<
"nmap <F1> :IndentGuidesToggle<cr>
" vim-afterglow 
"let g:airline_theme='afterglow'
"let g:afterglow_blackout=1
"let g:afterglow_italic_comments=1


" >>>
" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif
"<<<
