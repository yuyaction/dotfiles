"### VundleVim ###
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式
"--- ()をカラフルにする ---
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1

"--- SuperTab ---
Plugin 'ervandew/supertab'
let g:SuperTabContextDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-n>"

"--- html補完(html,CSSのみ) ---
Plugin 'mattn/emmet-vim'   
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

Plugin 'lervag/vimtex'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdtree'
"c,c++ 補完
Plugin 'justmao945/vim-clang'
"テンプレート
Plugin 'mattn/sonictemplate-vim'
Plugin 'Lokaltog/vim-powerline'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'aperezdc/vim-template'
call vundle#end()
filetype plugin indent on
"### VndleVim end ###

"### key-mapping ###
"ディレクトリツリー
nnoremap <silent><C-e> :NERDTreeToggle<CR>
inoremap <silent> jj <ESC>
inoremap <silent> っj <ESC>
inoremap <C-s> <Esc>:w<CR>
inoremap jj <Esc> :w<CR>
noremap <S-h> ^
noremap <S-l> $
"ノーマルモードでCR,Space,BS
noremap <CR> i<CR><ESC> 
noremap <Space> i<Space><ESC>
noremap <BS> i<BS><ESC>

inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
inoremap $ $$<LEFT>
"htmlだけ
if expand("%:e")=="html"
  inoremap < <><LEFT>
endif

" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
"インサート時のカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" 日本語入力がオンのままでも使えるコマンド(Enterキーは必要)
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy
" vimに矢印キーはいらない
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
cnoremap <Up> <Nop>
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
" カーソル移動のキーマップ
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
nnoremap 0 g0
nnoremap g0 0
nnoremap ^ g^
nnoremap g^ ^
nnoremap $ g$
nnoremap g$ $
inoremap <C-h> <Left>
inoremap <C-l> <Right>
"### key-mapping end ###

"### setting ###
"文字コードをUFT-8に設定
set fenc=utf-8
"バックアップファイルを作らない
set nobackup
"スワップファイルを作らない
set noswapfile
"編集中のファイルが変更されたら自動で読み直す
set autoread
"バッファが編集中でもその他のファイルを開けるように
set hidden
"入力中のコマンドをステータスに表示する
set showcmd
"### setting end ###

"### view ###
"行番号を表示
set number
"現在の行を強調表示
set cursorline
"行末の1文字先までカーソルを移動できるようにする
set virtualedit=onemore
"行頭,行末で行のカーソル移動を可能にする
"set whichwrap=b,s,h,l,<,>,[,],~ 
"インデントはスマートインデント
set smartindent
"ビープ音を可視化
set visualbell
"括弧入力時の対応する括弧を表示
set showmatch
hi MatchParen ctermbg=1
set matchpairs& matchpairs+=<:>
"ステータスラインを常に表示
set laststatus=2
"コマンドラインの補完
set wildmode=list:longest
"--- color ---
syntax on
colorscheme molokai
set t_Co=256

" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
"### view end ###

"### search ###
"検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
"検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
"検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
"検索時に最後まで行ったら最初に戻る
set wrapscan
"検索語をハイライト表示
set hlsearch
"ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
"### serch end ###

"### auto fcitx  ###
"ESCで自動的にIMをoffにする
let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction
set ttimeoutlen=150
"Leave Insert mode
autocmd InsertLeave * call Fcitx2en()
"### auto fcitx end ####

"### Languages ###
"--- C ---
packadd termdebug 
"マウスを使用
set mouse=a
let g:termdebug_wide = 163

"--- python --- 
"autoindent
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
"docstring window開かないようにする
autocmd FileType python setlocal completeopt-=preview


"vim内でF5でRunする(C,C++,Python,fortran対応)
command! Run call s:Run()
nmap <F5> :Run<CR>
function! s:Run()
  let e = expand("%:e")
  :w "一旦保存からの以下拡張子により分岐
  if e == "c"
    :Gcc
  endif
  if e == "cpp"
    :Gpp
  endif
  if e == "py"
    :Python
  endif
  if e == "f90" || e == "f95"
    :Gfortran
  endif
endfunction

command! Python call s:Python()
function! s:Python()
  :!python3 %
endfunction

command! Gcc call s:Gcc()
function! s:Gcc()
    :!gcc % -o %:r.out
    :!./%:r.out
endfunction

command! Gpp call s:Gpp()
function! s:Gpp()
    :!g++ % -o %:r.out
    :!./%:r.out
endfunction

command! Gfortran call s:Gfortran()
function! s:Gfortran()
    :!gfortran % -o %:r.out
    :!./%:r.out
endfunction
"### Languages end ###
