
" >>>>
" 插件安装

" 关闭兼容模式
set nocompatible              " be iMproved, required
" vundle 环境设置
filetype off                  " required
 
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
 
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'danilo-augusto/vim-afterglow'
Plugin 'flazz/vim-colorschemes' "颜色
Plugin 'scrooloose/nerdtree'    "nerdtree
Plugin 'majutsushi/tagbar'      "tagbar
Plugin 'humiaozuzu/TabBar'      "alt1~9
Plugin 'jiangmiao/auto-pairs'
Plugin 'taglist.vim'            "
Plugin 'scrooloose/nerdcommenter' "code comment
Plugin 'Lokaltog/vim-powerline' "
Plugin 'scrooloose/syntastic'" syntastic
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"Plugin 'Shougo/vimshell.vim'
"插件列表结束 
call vundle#end()            " required
filetype plugin indent on    " required
"<<<<
