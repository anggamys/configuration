# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Spaceship theme configuration
SPACESHIP_PROMPT_ASYNC=true
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_TIMEZONE="Asia/Jakarta"
SPACESHIP_TIME_FORMAT="at %T"
SPACESHIP_TIME_COLOR="yellow"
SPACESHIP_USER_SHOW=always
SPACESHIP_USER_COLOR="yellow"
SPACESHIP_DIR_COLOR="cyan"
SPACESHIP_DIR_TRUNCATE_TO=3
SPACESHIP_DIR_TRUNCATE_BEGINNING=true
SPACESHIP_GIT_SHOW=true
SPACESHIP_GIT_BRANCH_COLOR="magenta"
SPACESHIP_GIT_STATUS_COLOR="red"
SPACESHIP_GIT_STATUS_UNTRACKED="✗"
SPACESHIP_GIT_STATUS_ADDED="✚"
SPACESHIP_GIT_STATUS_DELETED="✖"
SPACESHIP_GIT_STATUS_MODIFIED="✹"
SPACESHIP_GIT_STATUS_RENAMED="➜"
SPACESHIP_GIT_STATUS_CLEAN="✔"
SPACESHIP_CHAR_COLOR="green"
SPACESHIP_CHAR_SUCCESS="❯"
SPACESHIP_CHAR_ERROR="❯"
SPACESHIP_CHAR_SYMBOL="➜"
SPACESHIP_CHAR_NEWLINE_FIRST_PROMPT=true
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_PROMPT_ORDER=(time user dir git line_sep char)

# Update behavior
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 13

# History configuration
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# General zsh options
setopt NO_CLOBBER              # Prevent accidental file overwrites
setopt AUTO_CD                 # cd to directory by typing its name
setopt CORRECT                 # Command correction
setopt COMPLETE_ALIASES        # Complete aliases

# Command execution timer
autoload -U add-zsh-hook
_command_time_preexec() {
    timer=$(($(date +%s%0N)/1000000))
}

_command_time_precmd() {
    if [ $timer ]; then
        local now=$(($(date +%s%0N)/1000000))
        local elapsed=$(($now - $timer))
        
        # Only show for commands that take longer than 1 second
        if [ $elapsed -gt 1000 ]; then
            if [ $elapsed -gt 60000 ]; then
                # Show minutes and seconds for long commands
                local minutes=$((elapsed / 60000))
                local seconds=$(((elapsed % 60000) / 1000))
                echo "⏱️  took ${minutes}m ${seconds}s"
            elif [ $elapsed -gt 10000 ]; then
                # Show seconds with 1 decimal place for medium commands
                local seconds=$((elapsed / 1000))
                local decimals=$(((elapsed % 1000) / 100))
                echo "⏱️  took ${seconds}.${decimals}s"
            else
                # Show milliseconds for quick commands
                local seconds=$((elapsed / 1000))
                local ms=$((elapsed % 1000))
                printf "⏱️  took %d.%03ds\n" $seconds $ms
            fi
        fi
        
        unset timer
    fi
}

add-zsh-hook preexec _command_time_preexec
add-zsh-hook precmd _command_time_precmd

# Performance optimizations
DISABLE_UNTRACKED_FILES_DIRTY=true  # Faster git status for large repos
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_MANUAL_REBIND=true

# Plugins configuration
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

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Key bindings
bindkey '^[[C' autosuggest-accept           # Right arrow to accept suggestion
bindkey '^[[A' history-substring-search-up   # Up arrow for history search
bindkey '^[[B' history-substring-search-down # Down arrow for history search
bindkey '^R' history-incremental-search-backward

# Environment variables
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR="nvim"
export BROWSER="firefox"
export PAGER="less"

# Less configuration
export LESS='-R -i -w -M -z-4'
export LESSHISTFILE="-"

# PATH configuration
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export PATH="/home/workspace/.config/herd-lite/bin:$PATH"

# Development environments
# NVM (Node Version Manager) for Node.js, npm, npx
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Rust cargo
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# PHP configuration
export PHP_INI_SCAN_DIR="/home/workspace/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# Linuxbrew
if [[ -d "/home/linuxbrew/.linuxbrew" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# ROS2 Humble
if [ -f "/opt/ros/humble/setup.zsh" ]; then
  source /opt/ros/humble/setup.zsh
fi

# ROS2 workspace (colcon build result)
if [ -f "$HOME/ros2_ws/install/setup.zsh" ]; then
  source $HOME/ros2_ws/install/setup.zsh
fi

# Workspace & tools (uncomment if needed)
# export PATH=$PATH:/home/workspace/ardu_ws/Micro-XRCE-DDS-Gen/scripts

# Ardupilot completion (uncomment if needed)
# [ -f "/home/workspace/developments/robotics/ardupilot/Tools/completion/completion.bash" ] && \
#   source "/home/workspace/developments/robotics/ardupilot/Tools/completion/completion.bash"

# Common aliases
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

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'
alias glog='git log --oneline --graph --decorate'

# Development aliases
alias py='python3'
alias pip='pip3'
alias n='npm'
alias y='yarn'
alias d='docker'
alias dc='docker-compose'
alias k='kubectl'

# System aliases
alias ports='netstat -tulanp'
alias myip='curl -s https://ipinfo.io/ip'
alias weather='curl wttr.in'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'

# Function to create and cd into directory
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Function to extract various archive formats (enhanced)
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Function to find and kill processes
killp() {
    ps aux | grep $1 | grep -v grep | awk '{print $2}' | xargs kill -9
}

# Function to create backup of files
backup() {
    cp "$1" "$1.backup.$(date +%Y%m%d_%H%M%S)"
}

# Load local configuration if exists
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Load aliases if exists
[ -f ~/.aliases ] && source ~/.aliases

# Load functions if exists
[ -f ~/.functions ] && source ~/.functions

# Completion initialization (should be near the end)
autoload -U compinit
compinit

# Load zsh-completions if installed via plugins
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

# Final PATH cleanup (remove duplicates)
typeset -U PATH