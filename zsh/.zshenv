# XDG User Dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export LOCAL_BIN="$HOME/.local/bin"

# Go
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$LOCAL_BIN/golib"
export PATH=$PATH:$GOPATH/bin
export GOPATH="$GOPATH:$HOME/Projects/go"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Deno
export PATH="$HOME/.deno/bin:$PATH"

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# GNU sed
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# Terraform - greedier by default
export TF_CLI_ARGS_plan="--parallelism=50 --compact-warnings"
export TF_CLI_ARGS_apply="--parallelism=50 --compact-warnings"

# Boto - used by gsutil
export BOTO_CONFIG="$XDG_CONFIG_HOME/.boto"

# Updates PATH w/ Google Cloud SDK.
source "$LOCAL_BIN/google-cloud-sdk/path.zsh.inc"

# gcloud shell command completion
source "$LOCAL_BIN/google-cloud-sdk/completion.zsh.inc"

# kubectl shell command completion
source <(kubectl completion zsh)
