" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'jlanzarotta/bufexplorer'
Plugin 'vim-scripts/minibufexplorerpp'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/winmanager'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'cespare/vim-toml'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-fugitive'
"Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/syntastic'

" go
Plugin 'fatih/vim-go'
Plugin 'Blackrush/vim-gocode'

" xml
Plugin 'othree/xml.vim'
Plugin 'plasticboy/vim-markdown'

"c/cpp
Plugin 'vim-scripts/omnicppcomplete'
Plugin 'junegunn/vim-easy-align'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'dense-analysis/ale'
Plugin 'yggdroot/leaderf'

" 配色方案
Plugin 'KeitaNakamura/neodark.vim'
Plugin 'crusoexia/vim-monokai'
Plugin 'altercation/vim-colors-solarized'

" 其他插件
Plugin 'aklt/plantuml-syntax'

" 插件列表结束
call vundle#end()
filetype plugin indent on

runtime! debian.vim
"设置编码
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,ucs-bom,chinese

"语言设置
set langmenu=zh_CN.UTF-8

"C语言自动缩进
"set smartindent

"状态行显示的内容
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set statusline=%F%*%=[L:%l/%L,C:%c][%p%%]

"解决backspace无效问题
set backspace=2
set backspace=indent,eol,start   " 插入模式下删除操作

"设置行号
set nu
set ruler

"突出显示当前行 
set cursorline
"突出显示当前列
set cursorcolumn

"设置状态栏,命令行显示输入命令和vim当前模式
set laststatus=2
set showcmd

"cmd底部显示模式
set showmode

"代码折叠相关
set foldmethod=syntax "用语法高亮来定义折叠
set foldlevel=100   "启动vim时不要自动折叠代码
set foldcolumn=0    "折叠栏宽度

"设置高亮搜索
set hlsearch
" 开启实时搜索
set incsearch
" 搜索时大小写不敏感
"set ignorecase

"帮助文档语言设置
set helplang=cn

"设置语法高亮
syntax enable
syntax on

"设置背景
set background=dark
"set background=light

"设置配色方案
"colorscheme neodark
"colorscheme monokai
colorscheme solarized

hi Comment ctermfg=red 

"可以在buffer的任何地方使用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"高亮显示匹配的括号
set showmatch

"去掉vi一致性
set nocompatible

"显示空白字符
"set list
"tab设置为4个空格
set ts=4
"设置缩进
set expandtab
"set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set autoindent " 继承前一行的缩进方式
set cindent
if &term=="xterm"
    set t_Co=8
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endif
set t_Co=256
set listchars=tab:>-,trail:-,eol:$

"设置一键编译
map <F7> :make<CR>

"设置默认shell
set shell=bash

"设置VIM记录的历史数
set history=100

"设置当文件被外部改变的时侯自动读入文件
if exists("&autoread")
    set autoread
endif

"设置ambiwidth
set ambiwidth=double

"设置文件类型
set ffs=unix,dos,mac

"设置折叠行 太长的行分多行展示
"set wrap
"set nowrap

"不在单词内部折行
"set linebreak

"设置静音模式
set noerrorbells
set novisualbell
set t_vb=

"不要备份文件
set nobackup
set nowb

" ctags
"启动vim时如果存在tags则自动加载
if exists("tags")
    set tags=./.tags;,.tags
endif
set tags+=~/.vim/tags/systags
map <F4> :!ctags -R .<CR> 

" supertab
let g:SuperTabDefaultCompletionType="context"
"let g:SuperTabRetainCompletionType=2
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"

" cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
set nocscopeverbose
nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>
if filereadable("cscope.out")
    cs add cscope.out  
    " else add the database pointed to by environment variable 
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif


" OmniCppComplete
" set nocp
" filetype on
" filetype plugin on
" filetype plugin indent on
" let OmniCpp_ShowScopeInAbbr = 0
" let OmniCpp_NamespaceSearch = 1
" let OmniCpp_GlobalScopeSearch = 1
" let OmniCpp_ShowAccess = 1
" let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
" let OmniCpp_MayCompleteDot = 1 " autocomplete after .
" let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
" let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
" let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
" set completeopt=menuone,menu,longest,preview

" MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=0

" NERDTree,Winmanager
"let g:NERDTree_title="[NERDTree]"
"let g:winManagerWindowLayout="NERDTree"
"function! NERDTree_Start()
"    exec 'NERDTree'
"endfunction
"
"function! NERDTree_IsValid()
"    return 1
"endfunction

let g:winManagerWindowLayout="FileExplorer"
" let g:winManagerWindowLayout="FileExplorer|TagList"
nmap wm : WMToggle<CR>

" Taglist
let Tlist_Display_Tag_Scope=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1

augroup filetype
    au! BufRead,BufNewFile *.sproto setfiletype sproto
augroup end

" YouCompleteMe
" 寻找全局配置文件
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" 禁用syntastic来对python检查
let g:syntastic_ignore_files=[".*\.py$"]
" 使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1
" 开启语义补全
" 修改对C语言的补全快捷键，默认是CTRL+space，修改为ALT+;未测出效果
" let g:ycm_key_invoke_completion = '<M-;>'
" 设置转到定义处的快捷键为ALT+G，未测出效果
" nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
" 默认tab补全
" let g:ycm_key_list_select_completion = ['<tab>','<Down>']
"关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
" 在接受补全后不分裂出一个窗口显示接受的项
set completeopt-=preview
" 让补全行为与一般的IDE一致
set completeopt=longest,menu
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0
" 每次重新生成匹配项，禁止缓存匹配项
let g:ycm_cache_omnifunc=0
" 语义触发
let g:ycm_auto_trigger=1
" 在注释中也可以补全
let g:ycm_complete_in_comments=1
" 输入第一个字符就开始补全
let g:ycm_min_num_of_chars_for_completion=1
" 错误标识符
let g:ycm_error_symbol='>>'
" 警告标识符
let g:ycm_warning_symbol='>*'
" 不查询ultisnips提供的代码模板补全，如果需要，设置成1即可
let g:ycm_use_ultisnips_completer=0

let g:ycm_server_python_interpreter='/usr/local/bin/python3'
"let g:ycm_add_preview_to_completeopt = 1
" 是否显示语法检测警告
let g:ycm_show_diagnostics_ui = 1 
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }

" Enable debugging
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'
let g:ycm_language_server =
  \ [
  \   {
  \     'name': 'yaml',
  \     'cmdline': [ '/path/to/yaml/server/yaml-language-server', '--stdio' ],
  \     'filetypes': [ 'yaml' ]
  \   },
  \   {
  \     'name': 'rust',
  \     'cmdline': [ 'ra_lsp_server' ],
  \     'filetypes': [ 'rust' ],
  \     'project_root_files': [ 'Cargo.toml' ]
  \   },
  \   {
  \     'name': 'godot',
  \     'filetypes': [ 'gdscript' ],
  \     'port': 6008,
  \     'project_root_files': [ 'project.godot' ]
  \    }
  \ ]
map <F2> :YcmCompleter GoToDefinition<CR>
map <F3> :YcmCompleter GoToDeclaration<CR>
map <F4> :YcmCompleter GoToDefinitionElseDeclaration<CR>

" vim-go
let g:go_version_warning = 0
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
map <F9> :GoDef<CR>
map <F10> :GoReferrers<CR>

" python
let g:python_host_prog = "/usr/bin/python3"

" vim-fugitive
nmap <F5> :Git blame<CR>

" gocode
nmap <F6> <C-x><C-o>
let g:gocode_autobuild = 1

" tagbar
map <F8> :TagbarToggle<CR>
"map <F3> :call SetTitle()<CR>

" comment
autocmd BufNewFile *.[ch],*.hpp,*.cpp,*.go,Makefile,*.mk,*.sh,*.pl,*.pm,*.py exec ":call SetTitle()"

"linter-ale http://www.skywind.me/blog/archives/2084
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

" 加入注释
func SetComment()
    call setline(1,"/*================================================================")
    call append(line("."),   "*   Copyright (C) ".strftime("%Y").". All rights reserved.")
    call append(line(".")+1, "*   ")
    call append(line(".")+2, "*   file : ".expand("%:t"))
    call append(line(".")+3, "*   coder: zemanzeng")
    call append(line(".")+4, "*   date : ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(line(".")+5, "*   desc : ")
    call append(line(".")+6, "*")
    call append(line(".")+7, "================================================================*/")
    call append(line(".")+8, "")
    call append(line(".")+9, "")
endfunc

" 加入shell,Makefile注释
func SetComment_sh()
    call setline(3, "#================================================================")
    call setline(4, "#   Copyright (C) ".strftime("%Y").". All rights reserved.")
    call setline(5, "#   ")
    call setline(6, "#   file : ".expand("%:t"))
    call setline(7, "#   coder: zemanzeng")
    call setline(8, "#   time : ".strftime("%Y-%m-%d %H:%M:%S"))
    call setline(9, "#   desc : ")
    call setline(10, "#")
    call setline(11, "#================================================================")
    call setline(12, "")
    call setline(13, "")
endfunc

" 定义函数SetTitle，自动插入文件头
func SetTitle()
    if &filetype == 'make'
        call setline(1,"")
        call setline(2,"")
        call SetComment_sh()

    elseif &filetype == 'sh'
        call setline(1,"#!/usr/bin/env bash")
        call setline(2,"")
        call SetComment_sh()

    elseif expand("%:e") == 'pl'
        call setline(1,"#!/usr/bin/perl -w")
        call setline(2,"")
        call SetComment_sh()
    elseif expand("%:e") == 'pm'
        call setline(1,"#!/usr/bin/perl -w")
        call setline(2,"")
        call SetComment_sh()

    elseif expand("%:e") == 'py'
        call setline(1,"#!/usr/bin/env python")
        call setline(2,"# coding=utf8")
        "call setline(3,"")
        call SetComment_sh()

    else
        call SetComment()
        if expand("%:e") == 'hpp'
            call append(line(".")+10, "#ifndef _".toupper(expand("%:t:r"))."_H")
            call append(line(".")+11, "#define _".toupper(expand("%:t:r"))."_H")
            call append(line(".")+12, "#ifdef __cplusplus")
            call append(line(".")+13, "extern \"C\"")
            call append(line(".")+14, "{")
            call append(line(".")+15, "#endif")
            call append(line(".")+16, "")
            call append(line(".")+17, "#ifdef __cplusplus")
            call append(line(".")+18, "}")
            call append(line(".")+19, "#endif")
            call append(line(".")+20, "#endif //".toupper(expand("%:t:r"))."_H")

        elseif expand("%:e") == 'h'
            call append(line(".")+10, "#pragma once")
        elseif &filetype == 'c'
            call append(line(".")+10,"#include \"".expand("%:t:r").".h\"")
        elseif &filetype == 'cpp'
            call append(line(".")+10, "#include \"".expand("%:t:r").".h\"")
        endif
    endif
endfunc

