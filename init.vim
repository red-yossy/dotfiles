"====================================================
" 基本設定
"====================================================
" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END
" ターミナルで256色表示を使う
set t_Co=256
set fenc=utf-8
" バックアップファイルやスワップファイルを作成しないようにする
set nowritebackup
set nobackup
set noswapfile
set autoread " 内容が変更されたら自動的に再読み込み
set hidden " バッファを閉じる代わりに隠す(Undo履歴を残すため) 複数ファイルの編集を可能にするため
set showcmd
set expandtab     "タブ入力を複数の空白入力に置き換える
set tabstop=2     "画面上でタブ文字が占める幅
set shiftwidth=2  "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    "改行時に前の行のインデントを継続する
set smartindent   "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
" 見た目の設定
set number
set cursorline
set smartindent
set showmatch " 対応する括弧などをハイライト表示する
set matchtime=3  " 対応括弧のハイライト表示を3秒にする
set matchpairs& matchpairs+=<:> " 対応括弧に'<'と'>'のペアを追加
set wildmode=list:longest
set list

"====================================================
" dein.vimの設定
"====================================================
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_dir=expand($XDG_CONFIG_HOME . '/dein')

" Required:
set runtimepath+=/Users/yossy/.config/dein//repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/yossy/.config/dein/')
  call dein#begin('/Users/yossy/.config/dein/')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/yossy/.config/dein//repos/github.com/Shougo/dein.vim')

  " launch vimproc first
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

  " TOML ファイル読み込み
  " プラグインは TOML ファイルにて読み込みタイミングを設定
  let s:toml=expand(s:dein_dir . '/dein.toml')
  let s:lazy_toml=expand(s:dein_dir . '/dein_lazy.toml')
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"====================================================
" lightline 設定
"====================================================
set laststatus=2 " ステータスラインを常に表示
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': {'c': 'NORMAL'},
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightlineModified',
      \   'readonly': 'LightlineReadonly',
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' },
      \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
  endif
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"====================================================
" VimFiler の設定
"====================================================
let g:vimfiler_as_default_explorer = 1 " デフォルトのエクスプローラーに設定
" Ctrl+f を２回押すことで VimFiler を起動
noremap <C-f><C-f> :VimFiler -split -simple -winwidth=45 -no-quit<ENTER>

"====================================================
" keymapping
"====================================================
" コピー＆ペースト map
" nnoremap <Space>d "*dd
" vnoremap <Space>d "*dd
" nnoremap <Space>y "*yy
" vnoremap <Space>y "*yy
" nnoremap <Space>p "*p
" vnoremap <Space>p "*p
" ESC キーを再割り当て
imap <c-j> <esc>
" 方向キー無効
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
