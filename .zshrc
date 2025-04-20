
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
# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# z command
source `brew --prefix`/etc/profile.d/z.sh

#--------------------------------------------------------------------------------
# Alias
#--------------------------------------------------------------------------------
# color
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'
alias grep='grep --color=auto'
# easy to use
alias ..='cd ../'
alias ...='cd ../../'
alias cat='bat'
alias j=z