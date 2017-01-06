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

## zsh

## Neovim 
