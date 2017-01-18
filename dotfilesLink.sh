#! /bin/sh

# 絶対パスの取得
abspath=$(cd $(dirname $0) && pwd)
# バックアップ用フォルダを作成
backuppath=${abspath}/.backup
if [ ! -e ${backuppath} ]; then
  mkdir ${backuppath}
fi

# 関数
need_backup()
{
  if [ -e $1 ]; then
    if [ ! -L $1 ]; then
      echo "$1 FILE is already EXIST."
      echo "$1 BACKUP to ${backuppath}."
      mv $1 ${backuppath}
      return 1
    fi
  fi
  return 0
}

exist_dir()
{
  if [ ! -e $1 ]; then
    echo "$1 directory is NOT found."
    echo "CREATE $1."
    mkdir -p $1
    return 1
  fi
  return 0
}

#==========================================
# 各 dotfile のシンボリックリンクを配置
#==========================================
# .bashrc & .bash_profile : bash の設定ファイル
need_backup $HOME/.bashrc
ln -sf ${abspath}/.bashrc ~/.bashrc
need_backup $HOME/.bash_profile
ln -sf ${abspath}/.bash_profile ~/.bash_profile
# .zshrc : zsh の設定ファイル
need_backup $HOME/.zshrc
ln -sf ${abspath}/.zshrc ~/.zshrc
# init.vim : Neovim の設定ファイル
exist_dir $HOME/.config/nvim
if [ $? -eq 0 ]; then
  need_backup $HOME/.config/nvim/init.vim
fi
ln -sf ${abspath}/init.vim ~/.config/nvim/init.vim
# dein.toml & dein_lazy.toml : dein のプラグイン設定ファイル
exist_dir $HOME/.config/dein
if [ $? -eq 0 ]; then
  need_backup $HOME/.config/dein/dein.toml
  need_backup $HOME/.config/dein/dein_lazy.toml
fi
ln -sf ${abspath}/dein.toml ~/.config/dein/dein.toml
ln -sf ${abspath}/dein_lazy.toml ~/.config/dein/dein_lazy.toml
