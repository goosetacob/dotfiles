# XDG User Dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export LOCAL_BIN="$HOME/.local/bin"

# local bin
export PATH="$LOCAL_BIN:$PATH"

# M1 Max
export ARCHFLAGS='-arch arm64'

# OhMyZsh
export ZSH_CUSTOM="$XDG_DATA_HOME/ohmyzsh/custom"

# Homebrew aarm64
eval "$(/opt/homebrew/bin/brew shellenv)"

# Nodejs
export N_PREFIX="$XDG_DATA_HOME/n"
export PATH="$N_PREFIX/bin:$PATH"

# Python 
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Go
export GOPATH=$HOME/Projects/go
export PATH="$GOPATH/bin:$PATH"

# OCaml
[[ ! -r /Users/gustavo/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# GNU sed
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# Boto - used by gsutil
export BOTO_CONFIG="$XDG_CONFIG_HOME/.boto"

# Terraform - greedier by default
export TF_CLI_ARGS_plan="--parallelism=50 -lock=false"
export TF_CLI_ARGS_apply="--parallelism=50"

