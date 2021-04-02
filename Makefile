.PHONY: brew-install build-rust-analyzer link-files

brew-install:
	brew bundle install --file ./Brewfile

build-rust-analyzer:
	./bin/build-rust-analyzer.sh

download-nvim:
	./bin/download-nvim-0.5.0.sh

link-files:
	./bin/link-files.sh
