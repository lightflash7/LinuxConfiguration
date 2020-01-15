"添加下面一句话要安装的插件  :source ~/.vimrc  :PlugStatus  :PlugInstall  完成 call plug#begin('~/.vim/plugged') 
"添加要安装的插件
"Plug 'beanworks/vim-phpfmt'

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
"Plug 'davidhalter/jedi-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer'}
Plug 'tpope/vim-surround' "符号改变，如双引号变单引号 cs “ ‘
Plug 'godlygeek/tabular' "对齐
Plug 'scrooloose/nerdcommenter'  "注释工具
Plug 'airblade/vim-gitgutter' "显示与git存储的变更 
call plug#end()






"*********************************下面是vim基础配置*******************************
set nocompatible "非兼容模式
set termguicolors ""使用系统truecolor而不是256色
set nu "显示行数
set mouse=a "允许鼠标操作
set ignorecase "搜索时忽略大小写
set incsearch "边输入边搜索
set showcmd  "显示未完成命令 
set completeopt-=preview
set tabstop=4             "tab缩进4格

"主题设置
"colorscheme molokai "变主题为molokai
set background=light
colorscheme solarized8 "变主题为solarized-light











"**********************************插件配置(addons setting)******************************
"airline
let g:airline_powerline_fonts = 1
let g:airline_theme="cobalt2"

"Nerdtree
autocmd vimenter * NERDTree "开启时自动打开NERDTree(四行)
autocmd VimEnter * NERDTree
wincmd w
autocmd VimEnter * wincmd w
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "如果是最后一个窗口直接退出vim
let NERDTreeWinSize=20 "设置窗口宽度

"Tarbar
nmap <F8> :TagbarToggle<CR>
                            "设置快捷键F8打开关闭
let g:tagbar_width = 20   "设置窗口宽度

"gitgutter
set updatetime=100  "延时100ms显示
















"*************************************F5一键compile*****************************************
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()    
	exec "w"
       	if &filetype == 'c'
       	exec '!g++ % -o %<' 
	exec '!time ./%<' 
        elseif &filetype == 'cpp'
	exec '!g++ % -o %<' 
	exec '!time ./%<'
        elseif &filetype == 'python' 
	exec '!time python3 %' 
        elseif &filetype == 'sh' :!time bash % 
	endif 
endfunc











"*************************************pythonPE8标准**************************************
au BufNewFile,BufRead *.py 
	\ set tabstop=4 | 
	\ set softtabstop=4 | 
	\ set shiftwidth=4 | 
	\ set textwidth=79 | 
	\ set expandtab | 
	\ set autoindent | 
	\ set fileformat=unix










"************************************vim快捷键设置***************************************
inoremap <C-W> <Esc>:wq<CR>
nnoremap <C-W> <Esc>:wq<CR>


