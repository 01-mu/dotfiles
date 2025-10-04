
#--------------------------------------------------------------------------------
# initialization
#---------------------------------------------------------------------------------
[ -d ./workspace ] && cd workspace

#--------------------------------------------------------------------------------
# Display
#--------------------------------------------------------------------------------
# only show current directory(%~) in prompt
PROMPT='%F{cyan}%~ %#%f '
# ls coloring
# reset -> directory setting 01:Bold 35:Purple
LS_COLORS='rs=0:di=01;35:';
export LS_COLORS

#--------------------------------------------------------------------------------
# History
#--------------------------------------------------------------------------------
# history
HISTFILE=$HOME/.zsh_history # save log
HISTSIZE=100000             # size of history in memory
SAVEHIST=1000000            # size of history in disk(is $HISTFILE)
# share .zshhistory
setopt inc_append_history   # append history to the history file immediately, not when the shell exits
setopt share_history        # share history between all sessions

#--------------------------------------------------------------------------------
# Complement
#--------------------------------------------------------------------------------
# enable completion
autoload -Uz compinit && compinit
# enable auto-completion
setopt auto_cd
# enable auto-completion for commands
setopt complete_in_word
# highlight completion candidates
zstyle ':completion:*:default' menu select=1
# speed up completion by caching
zstyle ':completion::complete:*' use-cache true
# ignore case when completing
# example: 'ls' and 'LS' are treated the same
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# narrow down completion
setopt list_packed
# ignore duplicates in history
setopt hist_ignore_dups
# when cd, automatically run ls
function chpwd() {
  echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"
  ls
}

#--------------------------------------------------------------------------------
# Tool Path
#--------------------------------------------------------------------------------

# initialize linuxbrew
# if [[ "$(uname)" == "Linux" ]]; then
#   eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# fi

export PATH="$HOME/.local/share/mise/shims:$PATH"

# initialize mise
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

# initialize zoxide(= z command)
eval "$(zoxide init zsh)"

#--------------------------------------------------------------------------------
# Alias
#--------------------------------------------------------------------------------
# easy to use
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'
alias grep='grep --color=auto'
alias lg='ls -la --color=auto | grep'
alias ..='cd ../'
alias ...='cd ../../'
alias j=z
upall() {
  sudo -v

  if command -v apt >/dev/null 2>&1; then
    echo -e "\n\033[1;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "📦  \033[1;36mAPT update...\033[0m"
    echo -e "\033[1;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    sudo apt update && sudo apt upgrade -y
  fi

  if command -v brew >/dev/null 2>&1; then
    echo -e "\n\033[1;35m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "🍺  \033[1;35mHomebrew update...\033[0m"
    echo -e "\033[1;35m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    brew update && brew upgrade
  fi
}

# docker
alias dc='docker compose'
alias dcb='docker compose build'
alias dcr='docker compose restart'
alias dcu='docker compose up -d'
alias dce='docker compose exec'
alias dcd='docker compose down'

# python
alias uvimain='uvicorn main:app --reload'

# java
export PATH="$HOME/.local/springboot/bin:$PATH"

#--------------------------------------------------------------------------------
# Expo Go
#--------------------------------------------------------------------------------
# export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d' ' -f2)
# export ADB_SERVER_SOCKET=tcp:$WSL_HOST:5037
# export ADB_TRACE=adb
# export EXPO_DEBUG=1
# export ANDROID_SERIAL=emulator-5554
# export REACT_NATIVE_PACKAGER_HOSTNAME=$(ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

#--------------------------------------------------------------------------------
# Japanese Character
#--------------------------------------------------------------------------------
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

