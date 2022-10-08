# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/ohmyzsh"

ZSH_THEME="" # disable oh-my-zsh themes

HYPHEN_INSENSITIVE="true"
DISABLE_LS_COLORS="true" # exa provides colors
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_UPDATE=true
plugins=(
  git
  docker
  docker-compose
  terraform
  cargo
  yarn
  zsh-autosuggestions # https://github.com/zsh-users/zsh-autosuggestions
  zsh-syntax-highlighting # https://github.com/zsh-users/zsh-syntax-highlighting
)

# autocomplete tools installed with brew
fpath+=/opt/homebrew/share/zsh/site-functions

source $ZSH/oh-my-zsh.sh

# pure prompt
# https://github.com/sindresorhus/pure
fpath+=$HOME/.config/zsh/pure
autoload -U promptinit; promptinit
zstyle :prompt:pure:git:stash show yes
prompt pure

# User Config
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"
export HISTSIZE=10000
export SAVEHIST=10000
export EDITOR="nvim"

# Individual tab history
unsetopt inc_append_history
unsetopt share_history

# Autocomplete hidden files
setopt globdots

# Setup McFly
eval "$(mcfly init zsh)"

# modern unix aliases
alias vim="nvim"
alias vi='nvim'
alias less="less --LINE-NUMBERS"
alias ls="exa --group-directories-first"
alias cat="bat --paging=never --style=plain"
alias comm="comm -12"

# util aliases
alias localscan="nmap -sn 192.168.1.0/24"
alias cleanup="find . -type f \( -name '.DS_Store' -o -name '.localized' \) -delete"
alias valid-yaml="ruby -ryaml -e 'p YAML.load(STDIN.read)' < "
alias p3-venv="python3 -m venv env"
alias luamake=/Users/gustavo/.dotfiles/personal/.local/bin/lua-language-server/3rd/luamake/luamake
