.PHONY: brew-install build-rust-analyzer download-nvim submodules link-files

brew-install:
	brew bundle install --file ./Brewfile

build-rust-analyzer:
	./bin/build-rust-analyzer.sh

download-nvim:
	./bin/download-nvim-0.5.0.sh

submodules:
	git submodule sync && git submodule update --init --recursive

link-files:
	./bin/link-files.sh
