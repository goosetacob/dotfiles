#!/usr/bin/env bash
CONFIG_HOME=$HOME/.config

###############
# xdg base dir spec
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
###############
mkdir -p $HOME/{.config,.cache,.local}
mkdir -p $HOME/.local/share

###############
# neovim
###############
mkdir -p $CONFIG_HOME/nvim/{plugged,undodir}
ln -svf $PWD/nvim/init.vim $CONFIG_HOME/nvim/init.vim
ln -svf $PWD/nvim/plugin $CONFIG_HOME/nvim
ln -svf $PWD/nvim/lua $CONFIG_HOME/nvim

###############
# oh-my-zsh
###############
mkdir -p $CONFIG_HOME/zsh
ln -svf $PWD/zsh/zshrc $CONFIG_HOME/zsh/.zshrc
ln -svf $PWD/zsh/pure $CONFIG_HOME/zsh/pure
ln -svf $PWD/zshenv $HOME/.zshenv

###############
# karabiner
###############
mkdir -p $CONFIG_HOME/karabiner
ln -svf $PWD/karabiner/karabiner.json $CONFIG_HOME/karabiner/karabiner.json

###############
# hstr
###############
ln -svf $PWD/hstr_blacklist $HOME/.hstr_blacklist

###############
# git
###############
ln -svf $PWD/gitconfig $HOME/.gitconfig

###############
# tmux
###############
mkdir -p $CONFIG_HOME/tmux
ln -svf $PWD/tmux/tmux.conf $CONFIG_HOME/tmux/tmux.conf
