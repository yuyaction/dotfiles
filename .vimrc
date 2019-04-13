"VundleVim
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'luochen1990/rainbow'
"Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'lervag/vimtex'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdtree'
"c,c++ 補完
Plugin 'justmao945/vim-clang'
"テンプレート
Plugin 'mattn/sonictemplate-vim'
"Plugin 'aperezdc/vim-template'
Plugin 'Lokaltog/vim-powerline'

call vundle#end()
filetype plugin indent on
"カッコに色付け
let g:rainbow_active = 1
"supertab
let g:SuperTabContextDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-n>"
"ディレクトリツリー
nnoremap <silent><C-e> :NERDTreeToggle<CR>
"key-mapping
inoremap <silent> jj <ESC>
inoremap <silent> っj <ESC>
noremap <S-h> ^
noremap <S-l> $
noremap <CR> i<CR><ESC> "ノーマルモードでCR,Space,BS
noremap <Space> i<Space><ESC>
noremap <BS> i<BS><ESC>

inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
"inoremap < <><LEFT>
inoremap $ $$<LEFT>

inoremap <C-s> <Esc>:w<CR>
inoremap jj <Esc> :w<CR>


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

" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
hi MatchParen ctermbg=1
set matchpairs& matchpairs+=<:>
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
"カラー表示
syntax on
colorscheme molokai
set t_Co=256

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"##### auto fcitx  ###########
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
"##### auto fcitx end ######

"about python
"自動インデント関連
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
"docstring window開かないようにする
autocmd FileType python setlocal completeopt-=preview
"実行コマンド
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
  :!python %
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
