export ZSH="$HOME/.oh-my-zsh"

SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_ASYNC=true

SPACESHIP_PROMPT_ORDER=(
  time
  user
  host
  dir
  git
  exec_time
  node
  bun
  golang
  java
  php
  python
  rust
  package
  kubectl
  docker
  docker_compose
  venv
  sudo
  line_sep
  char
)

SPACESHIP_RPROMPT_ORDER=()

SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_TIMEZONE="Asia/Jakarta"
SPACESHIP_TIME_FORMAT="at %T"
SPACESHIP_TIME_COLOR="yellow"

SPACESHIP_USER_SHOW=always
SPACESHIP_USER_COLOR="yellow"

SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_COLOR="blue"
SPACESHIP_HOST_PREFIX="@"

SPACESHIP_DIR_SHOW=true
SPACESHIP_DIR_COLOR="cyan"
SPACESHIP_DIR_TRUNC=3
SPACESHIP_DIR_TRUNC_PREFIX="…/"
SPACESHIP_DIR_LOCK_SYMBOL="🔒"
SPACESHIP_DIR_PREFIX="in "

SPACESHIP_GIT_SHOW=true
SPACESHIP_GIT_ASYNC=true
SPACESHIP_GIT_BRANCH_COLOR="magenta"
SPACESHIP_GIT_STATUS_COLOR="red"
SPACESHIP_GIT_STATUS_UNTRACKED="✗"
SPACESHIP_GIT_STATUS_ADDED="✚"
SPACESHIP_GIT_STATUS_MODIFIED="✹"
SPACESHIP_GIT_STATUS_DELETED="✖"
SPACESHIP_GIT_STATUS_RENAMED="➜"
SPACESHIP_GIT_STATUS_CLEAN="✔"
SPACESHIP_GIT_PREFIX="on "
SPACESHIP_GIT_SYMBOL=" "

SPACESHIP_EXEC_TIME_SHOW=true
SPACESHIP_EXEC_TIME_ELAPSED=1
SPACESHIP_EXEC_TIME_PRECISION=2
SPACESHIP_EXEC_TIME_PREFIX="⏱  "

SPACESHIP_NODE_SHOW=true
SPACESHIP_NODE_PREFIX="node "
SPACESHIP_NODE_COLOR="green"

SPACESHIP_BUN_SHOW=true
SPACESHIP_BUN_PREFIX="bun "
SPACESHIP_BUN_COLOR="yellow"

SPACESHIP_GOLANG_SHOW=true
SPACESHIP_GOLANG_PREFIX="go "
SPACESHIP_GOLANG_COLOR="cyan"

SPACESHIP_JAVA_SHOW=true
SPACESHIP_JAVA_PREFIX="java "
SPACESHIP_JAVA_COLOR="red"

SPACESHIP_KUBECTL_SHOW=true
SPACESHIP_KUBECTL_PREFIX="k8s "
SPACESHIP_KUBECTL_COLOR="blue"
SPACESHIP_KUBECTL_CONTEXT_SHOW=true
SPACESHIP_KUBECTL_NAMESPACE_SHOW=true

SPACESHIP_PACKAGE_SHOW=true
SPACESHIP_PACKAGE_PREFIX="pkg "
SPACESHIP_PACKAGE_COLOR="yellow"

SPACESHIP_PHP_SHOW=true
SPACESHIP_PHP_PREFIX="php "
SPACESHIP_PHP_COLOR="magenta"

SPACESHIP_PYTHON_SHOW=true
SPACESHIP_PYTHON_PREFIX="🐍 "
SPACESHIP_PYTHON_COLOR="green"

SPACESHIP_RUST_SHOW=true
SPACESHIP_RUST_PREFIX="rs "
SPACESHIP_RUST_COLOR="red"

SPACESHIP_VENV_SHOW=true
SPACESHIP_VENV_PREFIX="("
SPACESHIP_VENV_SUFFIX=") "
SPACESHIP_VENV_COLOR="green"

SPACESHIP_DOCKER_SHOW=true
SPACESHIP_DOCKER_PREFIX="🐳 "
SPACESHIP_DOCKER_COLOR="cyan"

SPACESHIP_DOCKER_COMPOSE_SHOW=true
SPACESHIP_DOCKER_COMPOSE_PREFIX="dc:"
SPACESHIP_DOCKER_COMPOSE_SYMBOL="🧩"
SPACESHIP_DOCKER_COMPOSE_COLOR="blue"

SPACESHIP_SUDO_SHOW=true
SPACESHIP_SUDO_SYMBOL="⚡ "
SPACESHIP_SUDO_PREFIX=""
SPACESHIP_SUDO_COLOR="yellow"

SPACESHIP_CHAR_COLOR="green"
SPACESHIP_CHAR_SUCCESS="❯"
SPACESHIP_CHAR_ERROR="❯"
SPACESHIP_CHAR_SYMBOL="➜"
SPACESHIP_CHAR_NEWLINE_FIRST_PROMPT=true
SPACESHIP_CHAR_SUFFIX=" "

ZSH_THEME="spaceship"

zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 13

plugins=(
  git
  zsh-z
  zsh-completions
  zsh-autosuggestions
  zsh-history-substring-search
  extract
  docker
  colored-man-pages
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

HISTSIZE=10000
SAVEHIST=10000
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

setopt NO_CLOBBER
setopt AUTO_CD
setopt CORRECT
setopt COMPLETE_ALIASES

bindkey '^[[C' autosuggest-accept
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^R' history-incremental-search-backward

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR="nvim"
export BROWSER="firefox"
export PAGER="less"

export LESS='-R -i -w -M -z-4'
export LESSHISTFILE="-"

path=(
  $HOME/.local/bin
  $HOME/bin
  $HOME/.config/composer/vendor/bin
  /home/workspace/.config/herd-lite/bin
  $path
)
typeset -U path

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

export BUN_INSTALL="$HOME/.bun"
path=("$BUN_INSTALL/bin" $path)

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

export PHP_INI_SCAN_DIR="/home/workspace/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

if [[ -d "/home/linuxbrew/.linuxbrew" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

zmodload zsh/complist
autoload -U compinit
compinit -C

[ -f "/opt/ros/humble/setup.zsh" ] && source /opt/ros/humble/setup.zsh

[ -f "$HOME/ros2_ws/install/setup.zsh" ] && source "$HOME/ros2_ws/install/setup.zsh"

if command -v register-python-argcomplete >/dev/null 2>&1; then
  eval "$(register-python-argcomplete ros2)"
  eval "$(register-python-argcomplete colcon)"
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias mkdir='mkdir -p'
alias cls='clear'
alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'

alias gf='git fetch'
alias gm='git merge'
alias gcl='git clone'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'
alias glog='git log --oneline --graph --decorate'

alias py='python3'
alias pip='pip3'
alias n='npm'
alias y='yarn'
alias d='docker'
alias dc='docker compose'
alias k='kubectl'

alias ports='netstat -tulanp'
alias myip='curl -s https://ipinfo.io/ip'
alias weather='curl wttr.in'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'

mkcd() { mkdir -p "$1" && cd "$1"; }

extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"     ;;
      *.tar.gz)    tar xzf "$1"     ;;
      *.bz2)       bunzip2 "$1"     ;;
      *.rar)       unrar e "$1"     ;;
      *.gz)        gunzip "$1"      ;;
      *.tar)       tar xf "$1"      ;;
      *.tbz2)      tar xjf "$1"     ;;
      *.tgz)       tar xzf "$1"     ;;
      *.zip)       unzip "$1"       ;;
      *.Z)         uncompress "$1"  ;;
      *.7z)        7z x "$1"        ;;
      *)           echo "'$1' tidak dikenali" ;;
    esac
  else
    echo "'$1' bukan file valid"
  fi
}

killp() { ps aux | grep "$1" | grep -v grep | awk '{print $2}' | xargs kill -9 2>/dev/null; }

backup() { cp "$1" "$1.backup.$(date +%Y%m%d_%H%M%S)"; }

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.functions ] && source ~/.functions

export ANDROID_HOME=$HOME/Android/Sdk
path+=($ANDROID_HOME/emulator $ANDROID_HOME/platform-tools)
