#!/usr/bin/env bash
LOCAL_BIN_DIR=$HOME/.local/bin
mkdir -p $LOCAL_BIN_DIR
cd $LOCAL_BIN_DIR
# https://github.com/neovim/neovim/releases/tag/nightly
curl -OL https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
tar xzvf nvim-macos.tar.gz
cd -
