# Checking for TMUX to avoid doubling these
if [[ -n $TMUX ]]; then
	PATH=`getconf PATH`
fi

# XDG User Dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export LOCAL_BIN="$HOME/.local/bin"

# M1 Max
export ARCHFLAGS='-arch arm64'

# OhMyZsh
export ZSH_CUSTOM="$XDG_DATA_HOME/ohmyzsh/custom"

# Homebrew x86
export PATH="/usr/local/bin:$PATH"

# Homebrew aarm64
eval "$(/opt/homebrew/bin/brew shellenv)"

# personal scripts
export PATH="$LOCAL_BIN/personal:$PATH"

# Go
export GOPATH=$HOME/Projects/go
export PATH=$PATH:$GOPATH/bin

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# OpenJDK (Java)
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Deno
# export PATH="$HOME/.deno/bin:$PATH"

# Yarn
export PATH="$HOME/.yarn/bin:$PATH"

# GNU sed
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# Terraform - greedier by default
export TF_CLI_ARGS_plan="--parallelism=75 -lock=false"
export TF_CLI_ARGS_apply="--parallelism=75"

# Boto - used by gsutil
export BOTO_CONFIG="$XDG_CONFIG_HOME/.boto"

# n
export N_PREFIX="$XDG_DATA_HOME/n"
export PATH="$N_PREFIX/bin:$PATH"

# Updates PATH w/ Google Cloud SDK.
# source "$LOCAL_BIN/google-cloud-sdk/path.zsh.inc"

# gcloud shell command completion
# source "$LOCAL_BIN/google-cloud-sdk/completion.zsh.inc"

# kubectl shell command completion
# source <(kubectl completion zsh)

# . "$HOME/.cargo/env"
