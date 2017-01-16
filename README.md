# My Settings
もの忘れが酷いので、備忘録。

macbook にイチから開発環境を構築したので、メモメモ。

今回は、python の環境を整える。

## develop environment
開発環境は、特に意味なし
- macOS Sierra ver10.12.2

## install softwares
インスコしていったものを入れた順番に列挙

## iTerm2
![alt text](http://iterm2.com/img/logo.jpg "xcode Logo")

http://iterm2.com/index.html

プリインの terminal でも問題ないのだが、とりあえず iTerm2 を入れておく。

## Xcode
![alt text](http://is2.mzstatic.com/image/thumb/Purple122/v4/b1/09/03/b10903fa-09c8-0efa-3dfd-88bb37b691fc/source/175x175bb.png "xcode Logo")

https://itunes.apple.com/jp/app/xcode/id497799835?mt=12

開発者ツールを入手。
AppStore にてインスコ。手順は省略。

## Command Line Tools for Xcode
Homebrew をインスコするために、こいつが必要。

```
% xcode-select --install
```

ポップアップが出てくるので、インストールする。同意も。

## Homebrew
![alt text](http://brew.sh/img/homebrew-256x256.png "brew Logo")

http://brew.sh/index_ja.html

Apple が用意してない、私に必要なものをインストールしてくれます。

これがなきゃ、やってられない。

言わずと知れた、 mac のパッケージ管理システム。

インスコは上記の URL に載っている以下のコマンドを実行。


```
% /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

実行すると、ワラワラとインストールを進めてくれます。

途中、パスワードやらを求められる。

インスコが終わると、 brew doctor を実行しろと言われます。

インストールが正常に行われたかをチェックしてくれるんですね。

優しい。

```
% brew doctor
Your system is ready to brew.
```

これで、 Homebrew のインスコは終わり。

かんたん簡単。バージョン確認。

```
% brew -v
Homebrew 1.1.6
Homebrew/homebrew-core (git revision 8b64; last commit 2017-01-04)
```

とりあえず、入れたらアップデートしておく。

```
% brew update
Updated 1 tap (homebrew/core).
==> Updated Formulae
aws-sdk-cpp         libmill             ripgrep             youtube-dl
cromwell            lsyncd              tippecanoe
elixir              node                transcrypt
gtk+3               node-build          wireguard-tools
==> Deleted Formulae
cpp-netlib
```

アップデートがあるとこんな感じになる。

ちなみに、 brew を使った場合は実体のインストール先が

```
/usr/local/Cellar/
```

になります。そこへのリンクを

```
/usr/local/bin/
```

の下に配置することで、パッケージの有効/無効を切り替えたりするんですねー。

使うときは、ここにあるリンクから使うことになります。

```/usr/local/bin/``` へのパスはデフォルトで通っているはず。。。

## zsh
http://www.zsh.org/

bash や他の shell が好みの場合は、入れなくても大丈夫。

入力補完が強力だと知って、 zsh に乗り換える。

インスコ。

```
% brew install zsh
```

ログインシェルを zsh に変更する。

とりあえず、現在変更可能な shell を見てみる。

```
% cat /etc/shells
# List of acceptable shells for chpass(1).
# Ftpd will not allow users to connect who are not using
# one of these shells.

/bin/bash
/bin/csh
/bin/ksh
/bin/sh
/bin/tcsh
/bin/zsh
```

zsh があるが、brew で入れた zsh を使いたいので、これに加える。

brew でインスコしたものは、アップデートとかの管理もしやすいので。

上でも書きましたが、brew のインスコ先は

```
/usr/local/bin/
```

の下になるので、

```
/usr/local/bin/zsh
```

を shells に書き加えればいいわけです。

shells の権限は root なので、書き換える時は sudo を使います。

```
% sudo vi /etc/shells
```

エディタはなんでも構いません。

書き加えたら、もう一度 shells を見て見ましょう。

```
% cat /etc/shells
# List of acceptable shells for chpass(1).
# Ftpd will not allow users to connect who are not using
# one of these shells.

/bin/bash
/bin/csh
/bin/ksh
/bin/sh
/bin/tcsh
/bin/zsh
/usr/local/bin/zsh
```

ちゃんと、追加できたらこんな感じになるはず。

それでは、ログインシェルを zsh に変更します。

ログインシェルの変更は、chsh コマンドを使います。

```
% chsh -s /usr/local/bin/zsh
```

これで完了。

terminal を再起動してみてください。

タイトルに zsh って出てれば成功です。

ちなみに、現在の shell の確認は、

```
% echo $SHELL
/usr/local/bin/zsh
```

でも、できます。

最後に設定ファイルを作って終わり。

```
% touch ~/.zshrc
```

中身は、とりあえず空で。

## zsh-completions

https://github.com/zsh-users/zsh-completions

zsh の補完機能を使うためのパッケージ。

これがあるから、zsh にしたと言っても過言ではない。

インストール。

```
% brew install zsh-completions
```

```.zshrc``` に以下の記述を。

```
fpath=(/path/to/homebrew/share/zsh-completions $fpath)

autoload -U compinit
compinit -u
```

zcompdump をリビルド。

```
% rm -f ~/.zcompdump; compinit
```

zsh を再起動すると、補完が拡張されているはず。

## Neovim

![alt text](https://neovim.io/images/logo@2x.png "neovim Logo")

https://neovim.io/

vim でも良かったけれど、どうせなら Neovim に乗り換えようかと思い立つ。

emacs の人は関係ないかなー。

インスコは、brew で

```
% brew install neovim/neovim/neovim
```

インスコできたら、起動。

起動は、 ```neovim``` ではなく ```nvim```

```
% nvim
```

ここで、エラーを吐いたら残念。

エラーの対処法は結構載っているので、gg ってください。

今まで、vim を使っていた場合は、vim の設定を移行できるので、

それも ggる。

とりあえず、設定ファイルを作成する。

```
% mkdir -p ~/.config/nvim
```

```
% touch ~/.config/nvim/init.vim
```

```init.vim``` が vim でいう ```.vimrc``` になるんですねー。

vim の設定を移行する場合は、 ```init.vim``` がリンクになって

```.vimrc``` を参照するようにするみたいです。

とりあえず、init.vim を新規で作成した場合は、空のままで。

## dein.vim

https://github.com/Shougo/dein.vim

言わずと知れた、Shougo さんの vim プラグインマネージャー。

「NeoBundle がオワコンだから dein を使おう！」って作者が言っちゃってるので、

NeoBundle ではなく dein にする。

そもそも NeoBundle は Neovim で動くのか？

dein は、TOML 形式でプラグインの管理を行う。

TOML については、下記参照。

https://github.com/toml-lang/toml

まぁ、簡単に言えば GitHub の中の人が考えた 設定ファイル用の言語。

でも、 NeoBundle でも TOML をサポートしてたわけだが、

もう、bug fix しかヤンない！って言ってるから、そこの観点でも dein を選択。

それに NeoBundle より dein の方が爆速らしい。

原因の追究は、置いとくとして。。。爆速ならそちらを使う！

やっと、インスコ。

とりあえず。インストールする場所を確保。

```
% mkdir -p ~/.config/dein
```

```
% cd ~/.config/dein
```

なんか、設定が散らばるのが嫌だから ```~/.config``` の下に ```dein``` ってディレクトリを掘る。

通例は、

```
mkdir -p ~/.cache/dein
```

とか、らしいけど。。。

とりあえず、インストールしたい場所で、以下のコマンドを打つ。

```
% curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
```

上記 URL に載っているので、読むよろし。

ほんで、できたスクリプトを叩く！

```
sh ./installer.sh
```

そしたら、init.vim (.vimrc) に加える設定が吐き出されるので、コピペ。

この時に、設定に書かれているパスは、 ```installer.sh``` を叩いた場所となる。

指定した場合は、その場所。

これを、 init.vim に貼り付ける。

ちなみに、こんなの

```
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/username/.config/dein//repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/username/.config/dein/')
  call dein#begin('/Users/username/.config/dein/')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/username/.config/dein//repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

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
```

最後の

```
call dein#install()
```

部分は、コメントアウトを外しておくとインストールされていないものが、

起動時にインストールされる。

init.vim にこの設定をコピペしたら、nvim を起動する。

```
% nvim hoge.txt
```

起動時にわらわらとインストールされたら、成功。

TOML ファイルによるプラグイン管理については、後で書くので dein.vim のインストールはここまで。

# python



----

備忘録なのに、説明口調になってしまう。。。病気かな？
