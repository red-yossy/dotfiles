# .bashrc

# cowsay message
[[ "$PS1" ]] && fortune | cowsay -n
 
# terminal disp color settings
export PS1='\[\033[0;36m\]\u@\h\[\033[0;35m\] \w \$\[\033[00m\]'

# custom commands
alias ls='ls -CF'
alias ll='ls -Alfh --show-control-chars --color=auto'
alias la='ls -CFal'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias sc='screen'
alias ps='ps --sort=start_time'

# envval settings
export PATH=$PATH:~/bin:/usr/local/
export PAGER='/usr/bin/lv -c'
export EDITOR='/usr/bin/vim'
export HISTSIZE=100000
export LANG='ja_JP.UTF-8'
export LC_ALL='ja_JP.UTF-8'
export LC_MESSAGES='ja_JP.UTF-8'

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

