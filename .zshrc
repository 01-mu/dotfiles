
#--------------------------------------------------------------------------------
# Display
#--------------------------------------------------------------------------------
# プロプトの表示をカレントディレクトリ(%~)のみに絞る
PROMPT='%F{cyan}%~ %#%f '
# lsの色 (default:exfxcxdxbxegedabagacad)
eval "$(dircolors -b)"

#--------------------------------------------------------------------------------
# Alias
#--------------------------------------------------------------------------------
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'

#--------------------------------------------------------------------------------
# History
#--------------------------------------------------------------------------------
# history
HISTFILE=$HOME/.zsh_history # 履歴を保存するファイル
HISTSIZE=100000             # メモリ上に保存する履歴のサイズ
SAVEHIST=1000000            # 上述のファイルに保存する履歴のサイズ
# share .zshhistory
setopt inc_append_history   # 実行時に履歴をファイルに追加していく
setopt share_history        # 履歴を他のシェルとリアルタイム共有する

#--------------------------------------------------------------------------------
# Complement
#--------------------------------------------------------------------------------
# enable completion
autoload -Uz compinit && compinit
# 一致するディレクトリに cdなしで移動できる
setopt auto_cd
# コマンドのスペルを修正(正しい可能性のある候補を表示)
# setopt correct
# コマンドラインの引数のスペルを修正
# setopt correct_all
# 単語の入力途中でもTab補完を有効化
setopt complete_in_word
# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
# 大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完リストの表示間隔を狭くする
setopt list_packed
# 直前と同じコマンドは履歴に追加しない
setopt hist_ignore_dups
# cdしたあとで、自動的に ls する
function chpwd() {
  echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"
  ls
}

#--------------------------------------------------------------------------------
# Tool Path
#--------------------------------------------------------------------------------
# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
