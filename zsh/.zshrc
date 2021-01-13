# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/gustavo/.oh-my-zsh"

# ZSH_THEME="alien-minimal/alien-minimal"
ZSH_THEME="spaceship" # https://github.com/denysdovhan/spaceship-prompt

HYPHEN_INSENSITIVE="true"
DISABLE_LS_COLORS="true" # exa provides colors
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
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

source $ZSH/oh-my-zsh.sh

# User Config
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export SSH_KEY_PATH="/Users/gustavo/.ssh/rsa_id"
export HISTFILE="/Users/gustavo/.config/zsh/.zsh_history"

# Spaceship Config
export SPACESHIP_CHAR_SYMBOL=" $ "

export SPACESHIP_TIME_SHOW=true
export SPACESHIP_TIME_PREFIX=""

export SPACESHIP_DIR_PREFIX=""

export SPACESHIP_GIT_BRANCH_PREFIX=""
export SPACESHIP_GIT_PREFIX=""

export SPACESHIP_PROMPT_ADD_NEWLINE=false
export SPACESHIP_PROMPT_SEPARATE_LINE=true
export SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  aws           # Amazon Web Services section
  terraform     # Terraform workspace section
  line_sep      # Line break
  exit_code     # Exit code section
  char          # Prompt character
)
export SPACESHIP_RPROMPT_ORDER=(
  exec_time     # Execution time
)

# Individual tab history
unsetopt inc_append_history
unsetopt share_history

# hstr
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=prompt-bottom,hicolor,raw-history-view,help-on-opposite-side,keywords-matching,blacklist
export HSTR_PROMPT="$ "
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)

# pyenv
export PATH="/Users/gustavo/.pyenv/shims:${PATH}"
export PYENV_SHELL=zsh
source '/usr/local/Cellar/pyenv/1.2.21/libexec/../completions/pyenv.zsh'
command pyenv rehash 2>/dev/null
pyenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(pyenv "sh-$command" "$@")";;
  *)
    command pyenv "$command" "$@";;
  esac
}

# aliases
alias vim="nvim"
alias vi='nvim'
alias less="less --LINE-NUMBERS"
alias localscan="nmap -sn 192.168.1.0/24"
alias ls="exa --group-directories-first"
alias cleanup="find . -type f \( -name '.DS_Store' -o -name '.localized' \) -delete"
alias valid-yaml="ruby -ryaml -e 'p YAML.load(STDIN.read)' < "
alias p3-venv="python3 -m venv env"
alias reload-zsh="nvim ~/.config/zsh/.zshrc"
alias reload-vim="nvim ~/.config/nvim/init.vim"
alias reload-tmux="nvim ~/.tmux.conf"
