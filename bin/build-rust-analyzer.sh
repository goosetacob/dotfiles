#!/usr/bin/env bash
LOCAL_BIN_DIR=$HOME/.local/bin
mkdir -p $LOCAL_BIN_DIR
pushd $LOCAL_BIN_DIR
git clone https://github.com/rust-analyzer/rust-analyzer.git
pushd rust-analyzer
cargo xtask install --server
pushd +0
