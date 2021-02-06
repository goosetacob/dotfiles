#!/usr/bin/env bash
cd /usr/local/bin
git clone https://github.com/rust-analyzer/rust-analyzer.git
cd rust-analyzer
cargo xtask install --server
cd $HOME
