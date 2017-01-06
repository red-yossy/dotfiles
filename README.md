# My Settings
もの忘れが酷いので、備忘録。

macbook にイチから開発環境を構築したので、メモメモ。

今回は、python の環境を整える。

## develop environment
開発環境は、特に意味なし
- macOS Sierra ver10.12.2

## install softwares
インスコしていったものを入れた順番に列挙

## Xcode
![alt text](http://is2.mzstatic.com/image/thumb/Purple122/v4/b1/09/03/b10903fa-09c8-0efa-3dfd-88bb37b691fc/source/175x175bb.png "xcode Logo")

AppStore にて入手。手順は省略。

## Command Line Tools for Xcode
Homebrew をインスコするために、こいつが必要。

```
% xcode-select --install
xcode-select: node: install requested for command line developer tools
```

ポップアップが出てくるので、インストールする。同意も。

## Homebrew
![alt text](http://brew.sh/img/homebrew-256x256.png "brew Logo")

http://brew.sh/index_ja.html

Apple が用意してない、私に必要なものをインストールしてくれます。

これがなきゃ、やってられない。

言わずと知れた、 mac のパッケージ管理soft。

上記の URL に載っている以下のコマンドを実行。


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

## Neovim 

![alt text](https://neovim.io/images/logo@2x.png "xcode Logo")

vim でも良かったけれど、どうせなら Neovim に乗り換えようかと思い立つ。

emacs の人は関係ないかなー。



----
備忘録なのに、説明口調になってしまう。。。病気かな？
