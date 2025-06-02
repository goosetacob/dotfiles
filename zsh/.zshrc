# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$XDG_CONFIG_HOME/ohmyzsh"

# ZSH_THEME="" # disable oh-my-zsh themes

HYPHEN_INSENSITIVE="true"
DISABLE_LS_COLORS="true" # eza provides colors
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_UPDATE=true
plugins=(
  git
  docker
  terraform
  cargo
  zsh-autosuggestions # https://github.com/zsh-users/zsh-autosuggestions
  zsh-syntax-highlighting # https://github.com/zsh-users/zsh-syntax-highlighting
)

# autocomplete tools installed with brew
# fpath+=/opt/homebrew/share/zsh/site-functions

source $ZSH/oh-my-zsh.sh

source $XDG_DATA_HOME/ohmyzsh/custom/plugins/zsh-async/async.zsh # https://github.com/mafredri/zsh-async
source $XDG_CONFIG_HOME/zsh/prompt.zsh

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

# modern unix aliases
alias vim="nvim"
alias less="less --LINE-NUMBERS"
alias ls="eza --group-directories-first"
alias cat="bat --paging=never --style=plain"
alias comm="comm -12"

# utils
function docker-clean {
  docker ps -a -q | xargs docker rm -f 2>/dev/null
  docker images | awk '{print $3}' | xargs docker rmi -f 2>/dev/null
  docker volume prune -f 2>/dev/null
  docker network prune -f 2>/dev/null
  docker system prune -f 2>/dev/null

  # delete build history
  docker buildx history ls --format json | jq -r '.ref | split("/") | .[2]' | xargs -n1 docker buildx history rm
}

function serial-connect {
  local serial_device=`ls /dev/cu.usbmodem* | gum choose`
  local baud_rate=`gum input --prompt='baud: ' --value=115200`

  # exit with: CTRL+SHFT+A and then CTRL+SHFT+X
  picocom -b $baud_rate $serial_device
}

# function unmount {
# to unmount the microbit before disconnecting USB
# ➜ diskutil list
# ➜ diskutil unmount /dev/disk4
# }

function calc-cidr {
# -sL: List Scan - simply list targets to scan
# -n: Never do DNS resolution
  nmap -sL -n $1 | awk '/Nmap scan report/{print $NF}'
}

function cleanup {
  rm -f $HOME/.local/state/nvim/lsp.log
  echo "deleted: $HOME/.local/state/nvim/lsp.log"

  rm -f $HOME/.local/state/nvim/conform.log
  echo "deleted: $HOME/.local/state/nvim/conform.log"
}

# Python
if command -v uv &> /dev/null; then
  eval "$(uv generate-shell-completion zsh)"
fi

# aliases
alias localscan="nmap -sn 192.168.1.0/24"
alias cleanup="find . -type f \( -name '.DS_Store' -o -name '.localized' \) -delete"
alias valid-yaml="ruby -ryaml -e 'p YAML.load(STDIN.read)' < "
