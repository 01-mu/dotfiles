
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

# initialize mise
if [[ "$(uname)" == "Darwin" ]]; then # for macOS
  eval "$(/opt/homebrew/bin/mise activate zsh)"
else
  eval "$(~/.local/bin/mise activate zsh)"
fi

# initialize zoxide(= z command)
eval "$(zoxide init zsh)"

# stopped to use brew on linux
## only run on Linux
#if [[ "$(uname)" == "Linux" ]]; then
#  # for Linuxbrew
#  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
#fi
#z command
#source `brew --prefix`/etc/profile.d/z.sh

#--------------------------------------------------------------------------------
# Alias
#--------------------------------------------------------------------------------
# color
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'
alias grep='grep --color=auto'

# shortcuts
alias lg='ls -la --color=auto | grep'

# easy to use
alias ..='cd ../'
alias ...='cd ../../'
alias j=z

# docker
alias dc='docker compose'
alias dcb='docker compose build'
alias dcr='docker compose restart'
alias dcu='docker compose up -d'
alias dce='docker compose exec'
alias dcd='docker compose down'

# python
alias uvmain='uvicorn main:app --reload'
