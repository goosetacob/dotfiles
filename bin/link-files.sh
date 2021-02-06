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
mkdir -p $CONFIG_HOME/nvim/{plugin,plugged,undodir}
ln -svf $PWD/nvim/init.vim $CONFIG_HOME/nvim/init.vim
for f in nvim/plugin/*; do
    ln -svf $PWD/$f $CONFIG_HOME/$f
done

###############
# oh-my-zsh
###############
mkdir -p $CONFIG_HOME/zsh
ln -svf $PWD/zsh/.zshrc $CONFIG_HOME/zsh/.zshrc

###############
# karabiner
###############
mkdir -p $CONFIG_HOME/karabiner
ln -svf $PWD/karabiner/karabiner.json $CONFIG_HOME/karabiner/karabiner.json

###############
# hstr
###############
ln -svf $PWD/.hstr_blacklist $HOME/.hstr_blacklist

###############
# git
###############
ln -svf $PWD/.gitconfig $HOME/.gitconfig
