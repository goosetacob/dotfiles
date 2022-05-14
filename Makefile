.PHONY: brew-install build-rust-analyzer download-nvim submodules link-files

brew-install:
	brew bundle install --file ./snapshots/Brewfile

brew-dump:
	mv -f ./snapshots/Brewfile ./snapshots/Brewfile.`date +%s` && brew bundle dump --file ./snapshots/Brewfile

submodules:
	git submodule sync && git submodule update --init --recursive
