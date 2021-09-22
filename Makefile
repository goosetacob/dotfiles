.PHONY: brew-install build-rust-analyzer download-nvim submodules link-files

brew-install:
	brew bundle install --file ./Brewfile

brew-dump:
	mv -f Brewfile Brewfile.bk && brew bundle dump

build-rust-analyzer:
	./bin/build-rust-analyzer.sh

submodules:
	git submodule sync && git submodule update --init --recursive

link-files:
	./bin/link-files.sh
