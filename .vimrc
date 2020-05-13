""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 去除VI一致性,必须
set nocompatible         
" 必须
filetype off    
" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'
" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.
" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'
"Plugin 'tpope/vim-fugitive'
" 来自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
"Plugin 'L9'
" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
"Plugin 'git://git.wincent.com/command-t.git'
" 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
"Plugin 'file:///home/gmarik/path/to/plugin'
" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
"Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'vim-utils/vim-man'
" 你的所有插件需要在下面这行之前
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
" 将你自己对非插件片段放在这行之后
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim配置立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

let mapleader=";"
set modelines=0
set backspace=2 "设置更好的删除
set history=50  "历史纪录数
autocmd InsertLeave * se nocul "用浅色高亮当前行
autocmd InsertEnter * se cul
set paste
set cul
set number "显示行号
set smartindent  "智能对
set autoindent "自动对齐
set confirm "在处理未保存或只读文件的时候，弹出确认框
set bg=dark
set tabstop=4  
set shiftwidth=4  
set expandtab  
set softtabstop=4  
set noswapfile

"set nohlsearch
set hlsearch
set incsearch "搜素高亮,搜索逐渐高亮
set cursorline "突出显示当前行

"set gdefault "行内替换

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1 "编码设置

set guifont=Menlo:h16:cANSI "设置字体
set langmenu=zn_CN.UTF-8
set helplang=cn  "语言设置

set ruler "在编辑过程中，在右下角显示光标位置的状态行
set laststatus=1  "总是显示状态行
set showcmd "在状态行显示目前所执行的命令，未完成的指令片段也会显示出来
set scrolloff=3 "光标移动到buffer的顶部和底部时保持3行的距离
"set showmatch "高亮显示对应的括号
set matchtime=5 "对应括号高亮时间(单位是十分之一秒)
set autowrite "在切换buffer时自动保存当前文件
set wildmenu  "增强模式中的命令行自动完成操作
set linespace=2 "字符间插入的像素行数目
set whichwrap=b,s,<,>,[,] "开启normal 或visual模式下的backspace键空格键，
                          "左右方向键,insert或replace模式下的左方向键，右方向键的跳行功能
filetype plugin indent on "分为三部分命令:file on,file plugin on,file indent on 
                          "分别是自动识别文件类型, 用用文件类型脚本,使用缩进定义文件

set magic  "设置魔术？神马东东
set ignorecase "搜索忽略大小写
filetype on "打开文件类型检测功能

set mouse= "鼠标默认值

" 自动切换vim工作目录
" set autochdir
" :cd   改变vim的当前工作路径
" :lcd  改变当前窗口的工作路径
" :pwd  查看当前的工作路径
" 用空格键来开关折叠
set foldenable
set foldmethod=manual
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"-------------------------------  
" 代码折叠  
"---------------------------  
set foldmarker={,}
set foldmethod=marker
set foldmethod=syntax
set foldlevel=100       " Don't autofold anything   
set foldopen-=search   " don't open folds when you search into them  
set foldopen-=undo     " don't open folds when you undo stuff  
set foldcolumn=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
behave mswin 
if has("autocmd")                                                                                                          
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif                             
    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"  
    au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"  
    au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block" 

    " autocmd BufNewFile,Bufread *.hal set syntax=help
    au BufRead,BufNewFile *.hal set filetype=c 
    au BufRead,BufNewFile *.bp set filetype=make 
    au BufRead,BufNewFile *.txt set filetype=c 
    au BufRead,BufNewFile *.log set filetype=c 
endif 

"##################################################################[auto exec cmds]
"autocmd VimEnter * TagbarToggle "auto start cmd
"autocmd VimEnter * WMToggle "auto start cmd
"autocmd VimEnter * NERDTree "auto start cmd

"default themes
"autocmd VimEnter * call UserFunctionSwitch(6)
"default show line number
autocmd VimEnter * call UserFunctionSwitch(0)
" default enable mouse
autocmd VimEnter * call UserFunctionSwitch(1)
"行号切换
map <silent> <Leader>n : call UserFunctionSwitch(0) <CR>
"鼠标切换
nmap <silent> <Leader>m : call UserFunctionSwitch(1) <CR>
"Open Nerdtree when start vim with no argument
if argc() == 0 && !exists("s:std_in")
"   autocmd VimEnter * WMToggle
endif
autocmd BufNewFile * call UserFunctionSwitch(52)
"neadtree
nmap <silent> <Leader>nt : call UserFunctionSwitch(2) <CR>
"tagbarlist
nmap <silent> <Leader>tl : call UserFunctionSwitch(3) <CR>
"mru, file open history record
" nmap <silent> <Leader><F4> : call UserFunctionSwitch(4) <CR>
"file search
nmap <silent>  <Leader>cp : exec "CtrlP ." <CR>
"ctrlpFunky
nmap <silent> <Leader>cf : exec 'CtrlPFunky' <CR>
nmap <silent> <Leader>cff : exec 'CtrlPFunky ' . expand('<cword>') <CR>
"make source tags
nmap <silent>  <Leader>ct : call UserFunctionSwitch(5) <CR>
nmap <silent> <Leader>cs : call UserFunctionSwitch(51) <CR>
"miniBuf
nmap <silent> <Leader><F6> : call UserFunctionSwitch(70) <CR>
"buf exploler
nmap <silent> <F6> : call UserFunctionSwitch(7) <CR>
nmap <silent> 9 : call UserFunctionSwitch(7) <CR>
"quickfix 
nmap <silent> <F7> : call UserFunctionSwitch(8) <CR>
"nmap <silent> 8 : call UserFunctionSwitch(80) <CR>
"nmap <silent> 9 : call UserFunctionSwitch(81) <CR>
"themes switch
nmap <silent> <Leader><F7> : call UserFunctionSwitch(6) <CR>

nmap <silent> <F8> : call UserFunctionSwitch(50) <CR>
nmap <silent> <F9> : :w <CR>
"ack search file & symbols
nmap <Leader>s : Ack <Space>
nmap <Leader>f : AckFile <Space>
nmap <Leader>q : q <CR>
nmap <Leader>qa : qall <CR>
" ag
nmap :ag : Ag -i <Space>
nmap :af : AgFile -i <Space>
" quit all & save session.vim.
nmap <F12> : call UserFunctionSwitch(30) <CR>
nmap :qs : call UserFunctionSwitch(30) <cr>
nmap <Leader>wq : wq <CR>
nmap <Leader>w : w <CR>
nmap :W : w <CR>
imap :w : :w <CR>
nmap <Leader>rn : %s/\r//g <CR> "替换^Ｍ
nmap <Leader>rs : call LeaveHandler() <Space> 
" cscope
nmap cc : cscope find c <Space>
nmap cd : cscope find d <Space>
nmap cf : cscope find f <Space>
nmap cg : cscope find g <Space>
nmap cs : cscope find s <Space>
nmap ct : cscope find t <Space>
"nmap 1 : bp <cr>
"nmap 2 : bn <cr>
"nmap <Leader>1 : bd <cr>
"nmap <Leader>3 : PluginInstall <cr>
"nmap 3 : cn <cr>
"nmap 4 : cp <cr>
"nmap 5 <C-]>
"nmap 6 <C-o>
"nmap 7 <C-i>

"##################################################################[ctags]
" Press F5 to update make ctags.
" cd ~/.ctags
" ctags -R ${source_path}
"silent !~/.vim/shell/make-ctags.sh
let g:pwd = getcwd()
let g:Newpwd = getcwd()
"let g:Newpwd = substitute(g:pwd, $HOME, "", "")
let g:Newpwd = "~/.ctags/" . substitute(g:Newpwd, "/", "_", "g")

let settag = "set tags=" . g:Newpwd . "/tags"
"echo settag
"echo g:Newpwd
exec settag

let g:argc = argc()
let g:argv = argv(0)
"echo "argv:" g:argv "argc:" g:argc  

if (expand(g:argv) == expand("clean")) 
    let g:clean = 1
    echo "clean all session.vim.."
    silent :!~/.vim/shell/del.sh
endif

"##################################################################[TlistToggle,NERDTree]
let NERDTreeQuitOnOpen=1 "打开文件时关闭树
let NERDTreeShowBookmarks=1 "显示书签
let Tlist_Show_One_File = 1 " 不同时显示多个文件的 tag ，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1 " 如果 taglist 窗口是最后一个窗口，则退出 vim
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Open = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F7> :TlistToggle<CR>
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window = 1

nmap <F8> :SrcExplToggle<CR>
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
let g:SrcExpl_winHeight = 8
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_isUpdateTags = 0

let NERDTreeWinPos = "left"
nmap <F9> :NERDTreeToggle<CR>
" man map
nmap m :Man <C-R>=expand("<cword>")<CR><CR>
nmap vm :Vman <C-R>=expand("<cword>")<CR><CR>
nmap mk :make <C-R><CR><CR>
"##################################################################[Ctrlp]
set rtp+=~/.vim/bundle/ctrlp.vim
:helptags ~/.vim/bundle/ctrlp.vim/doc
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'cra'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm|out|gen)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc|a|img|apk|bak|ko|deb|~|swp|tmp|html|jpg|png|bmp|ogg|log|jar|o)$',
    \ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.exe,*.tar,*.deb,*~,*.bak,*.ko,*.bin,*.img,*.apk,*.jar
let g:ctrlp_regexp = 1
let g:ctrlp_cache_dir = '~/.cache/ctrlp'
let g:ctrlp_show_hidden = 0
" sudo apt-get install silversearcher-ag
" when use ag ,add custom ignore to : ~/.agignore
if executable('ag')
    let g:ag_highlight=1
    " let g:ctrlp_use_caching = 1
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
else
    let g:ctrlp_use_caching = 1
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
    let g:ctrlp_prompt_mappings = {'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'], }
endif
" echo "g:ctrlp_user_command :" g:ctrlp_user_command
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_depth = 100
let g:ctrlp_max_files = 5000000
" ctrlpFunky
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_use_cache = 1
let g:ctrlp_funky_nolim = 1

"##################################################################[LeaderF]##################################################################
"dont show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
"popup mode need vim8.1
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>
" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
"##################################################################[winManager]
let g:NERDTree_title="[NERDTree]"  
let g:winManagerWindowLayout='NERDTree'

function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction  
  
function! NERDTree_IsValid()  
    return 1  
endfunction  

" NOTIC!!! modefiy WinManager.vim to fixed open empty file bug:
"function! <SID>ToggleWindowsManager()  
"   if IsWinManagerVisible()  
"      call s:CloseWindowsManager()  
"   else  
"      call s:StartWindowsManager()  
"      exe 'q'  " ADD THIS LINE!
"   end  
"endfunction  

"##################################################################[MiniBufExplorer]
let g:default_open_minibufexplorer = 0
let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0 

"BufExplorer
set rtp+=~/.vim/bundle/bufexplorer
 
let g:bufExplorerShowRelativePath=0  " Show absolute paths.
let g:bufExplorerSortBy='extension'
let g:bufExplorerSortBy='fullpath'
let g:bufExplorerSortBy='mru'
let g:bufExplorerSortBy='name'
let g:bufExplorerSortBy='number' 

"nmap <silent> <s-F7> :BufExplorer<CR> 
"nmap <silent> <m-F7> :BufExplorerHorizontalSplit<CR>
"nmap <silent> <c-F7> :BufExplorerVerticalSplit<CR>
"##################################################################[SuperTab]
let g:SuperTabDefaultCompletionType="context" 

"##################################################################[TagbarToggle]
let g:tagbar_ctags_bin = 'ctags'  
let g:tagbar_width = 30 



"##################################################################[auto-pairs]
set runtimepath^=~/.vim/bundle/auto-pairs
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'
set laststatus=2
"##################################################################[nerdcommenter] "\cc 注释当前行和选中行  
"\cu 取消注释 
set rtp+=~/.vim/bundle/nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCompactSexyComs = 1

"##################################################################[ack]
set rtp+=~/.vim/bundle/ack.vim
let g:ackprg = '~/.vim/shell/xgrep' "find symbols and files.
let g:ack_autoclose = 1
let g:ackpreview = 1
let g:ackhighlight = 1
let g:ack_autofold_results = 0
let g:ack_lhandler = "botright lopen 8"
let g:ack_qhandler = "botright copen 8"

"##################################################################[resume history]
let g:AutoSessionFile = g:Newpwd . "/session.vim"
if(expand(g:AutoSessionFile) == findfile(expand(g:AutoSessionFile)))
    silent :!~/.vim/shell/copy.sh
    au VimEnter * source ~/.ctags/session.vim
endif

if has("cscope")
    " set csprg=/usr/bin/cscope
    set csprg=cscope
    set csto=1
    set cst
    set nocsverb
    " add any database in current directory
    " if filereadable("cscope.out")
        " cs add cscope.out
        " else add database pointed to by environment
    " elseif $CSCOPE_DB != ""
        " cs add $CSCOPE_DB
    " endif
    set csverb
endif
let g:AutoCscopeFile = g:Newpwd . "/cscope.out"
if(expand(g:AutoCscopeFile) == findfile(expand(g:AutoCscopeFile)))
    " 必须这样截取,否则多余的结束符^@会导致cs add 异常. 
    let path = strpart(g:AutoCscopeFile, 0, match(g:AutoCscopeFile, "cscope.out")) 
    let cmd = "cs add " . path . "cscope.out"
    " echo "path:" path
    " echo "cmd:" cmd
    silent: exec cmd
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:quit_save = 0
au VimLeave * call LeaveHandler()
function! LeaveHandler()
    if (g:quit_save == 1) 
        let g:path = system("~/.vim/shell/get_path.sh " . shellescape(expand('%:h')))
        let execcmd = "mks! ". g:path
"       echo execcmd
        exec execcmd
    else
        echo "exit but no save session.vim"
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" linux 源码阅读特殊配置
set tags=/home/hongchunbo/develop/opensource/linux-2.6.30.4/tags
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb
cs add /home/hongchunbo/develop/opensource/linux-2.6.30.4/cscope.out /home/hongchunbo/develop/opensource/linux-2.6.30.4
set csverb
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:userFuncSwitch = 1
let g:line_number_show = 0
let g:mouse_enable = 0
let g:window_flag = 1
let g:MRU_flag = 0
let g:themes_flag = 3
let g:ctags = ""
let g:quickfix = 0

function! UserFunctionSwitch(cmd)
let g:userFuncSwitch = a:cmd
exec ":syntax on"

if a:cmd == 0
    if g:line_number_show == 0
        exec 'set nu'
        let g:line_number_show = 1
        "echo 'Show line number!'
    else
        exec 'set nonu'
        let g:line_number_show = 0
    endif
    return
endif

if a:cmd == 1
    if g:mouse_enable == 0
        let g:mouse_enable = 1
        exec 'set mouse=n' 
        echo 'enable mouse'
    else
        let g:mouse_enable = 0 
       exec 'set mouse='
        echo 'disable mouse'
    endif
    return
endif

if a:cmd == 2
    exec 'WMToggle'
    return
endif

if a:cmd == 3
    exec 'TagbarToggle'
    return
endif

if a:cmd == 4
    if g:MRU_flag == 0
        let g:MRU_flag = 1
        exec 'MRU'
    else
        let g:MRU_flag = 0
        exec 'MRU'
        exec 'q'
    endif
    return
endif

if a:cmd == 5
    echo "Start make tag.."
    let g:time1 = localtime() 
    let g:ctags = system("~/.vim/shell/make-ctags.sh " . shellescape(expand('%:h')))
    let g:ctag_execcmd = "set tags+=" . g:ctags
    "echo g:ctag_execcmd
    exec g:ctag_execcmd
    let g:time2 = localtime()
    echo g:ctag_execcmd "escape time:" (g:time2 - g:time1)"s"
    return
endif

" 一键更新ctags & cscope..
if a:cmd == 50
    " exec g:ctag_execcmd
    " cs kill -1
    " exec g:cscope_cmd
    return
endif

if a:cmd == 51
    echo "Start make cscope.."
    let t1 = localtime() 
    let db = system("~/.vim/shell/cscope.sh " . shellescape(expand('%:p')))
    echo db
    let path = strpart(db, 0, match(db, "cscope.out")) " 必须这样截取,否则多余的结束符^@会导致cs add 异常.
    echo "is good" 
    echo "path->"path
    let g:cscope_cmd = "cs add " . path . "cscope.out"
    echo g:cscope_cmd
    cs kill -1
    exec g:cscope_cmd
    let t2 = localtime()
    echo "escape time:" (t2 - t1)"s"
    return
endif

" 监听执行命令
if a:cmd == 52
    " let cwd = getcwd()
    " echo "cwd:" cwd
    return
endif


if a:cmd == 6

    if g:themes_flag == 0
        let g:themes_flag = 1
        exec "colorscheme solarized"
        let g:molokai_original = 0
        let g:rehash256 = 0
        exec "set background=dark" 
        exec "set t_Co=32"
        return
    endif
    if g:themes_flag == 1
        let g:themes_flag = 2
        exec "colorscheme molokai"
        let g:molokai_original = 1
        let g:rehash256 = 1
        exec "set background=dark" 
        exec "set t_Co=256"
        return
    endif

    if g:themes_flag == 2
        let g:themes_flag = 3 
        let g:molokai_original = 0
        let g:rehash256 = 0
        exec "colorscheme default"
        exec "set background=light"
        exec "set t_Co=128"
        return
    endif

    if g:themes_flag == 3
        let g:themes_flag = 1 

        exec "set background=dark"
        exec "set t_Co=256"
        return
    endif
    return
endif


if a:cmd == 70
    exec 'TMiniBufExplorer'
    return
endi

if a:cmd == 7
    exec 'ToggleBufExplorer'
    return
endif

if a:cmd == 8
    if g:quickfix == 0
        let g:quickfix = 1
        exec "cclose"
    else
        let g:quickfix = 0
        exec "copen"
    endif
    return
endif

if a:cmd == 80
    if g:quickfix == 1
        exec "bn"
    else
        exec "cn"
    endif
    return
endif

if a:cmd == 81
    if g:quickfix == 1
        exec "bp"
    else
        exec "cp"
    endif
    return
endif

if a:cmd == 20
    "call MyTabLine()
    "echo 'tab:' tab
    return
endif

if a:cmd == 30
    let g:quit_save = 1
    exec "qall"
    return
endif

endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"###################################################################[cscope]
" http://blog.csdn.net/citongke1/article/details/8497244

" 安装：
" sudo apt-get install cscope

" 创建索引：
" cscope -Rbq
" 把需要创建索引的文件类型输入到这个文件
" find . -type f > cscope.files

" 添加到vim：
" :cs add ./cscope.out

" 查找函数func：
" :cs find s func

" vim支持8种cscope的查询功能，如下：
" s: 查找C语言符号，即查找函数名、宏、枚举值等出现的地方（包括头文件）
" g: 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能（比如有可能只在头文件处）
" d: 查找本函数调用的函数
" c: 查找调用本函数的函数
" t: 查找指定的字符串
" e: 查找egrep模式，相当于egrep功能，但查找速度快多了
" f: 查找并打开文件，类似vim的find功能
" i: 查找包含本文件的文件
" 其他功能可输入：help cscope查看
