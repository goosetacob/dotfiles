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
  # docker-compose SLOW
  terraform
  cargo
  # yarn SLOW
  zsh-autosuggestions # https://github.com/zsh-users/zsh-autosuggestions
  zsh-syntax-highlighting # https://github.com/zsh-users/zsh-syntax-highlighting
)

# autocomplete tools installed with brew
fpath+=/opt/homebrew/share/zsh/site-functions

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

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

# utils
function docker-clean {
  docker ps -a -q | xargs docker kill -f
  docker ps -a -q | xargs docker rm -f
  docker images | awk '{print $3}' | xargs docker rmi -f
  docker volume prune -f
}

# aliases
alias localscan="nmap -sn 192.168.1.0/24"
alias cleanup="find . -type f \( -name '.DS_Store' -o -name '.localized' \) -delete"
alias valid-yaml="ruby -ryaml -e 'p YAML.load(STDIN.read)' < "
