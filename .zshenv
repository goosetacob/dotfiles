# XDG User Dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Neovim
export PATH=$PATH:$HOME/build/nvim-osx64/bin

# ZSH
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Go
export GOPATH=$HOME/Projects/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Deno
export PATH="$HOME/.deno/bin:$PATH"

# FlameGraph
export PATH="$PATH:$GOPATH/src/github.com/uber/go-torch/FlameGraph"

# Flutter
export PATH="$PATH:/usr/local/bin/flutter/bin"

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# GNU sed
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# Boto - used by gsutil
export BOTO_CONFIG="$XDG_CONFIG_HOME/.boto"

# Updates PATH w/ Google Cloud SDK.
source '/usr/local/bin/google-cloud-sdk/path.zsh.inc'

# gcloud shell command completion
source '/usr/local/bin/google-cloud-sdk/completion.zsh.inc'

# Flutter shell command completion
source <(flutter bash-completion)

# kubectl shell command completion
source <(kubectl completion zsh)
