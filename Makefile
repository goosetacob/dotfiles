.PHONY: brew-install submodules
HOSTNAME:=$(shell hostname -s)

brew-install:
	brew bundle install --file ./snapshots/Brewfile.${HOSTNAME};

brew-dump:
	rm ./snapshots/Brewfile.${HOSTNAME} && brew bundle dump --file ./snapshots/Brewfile.${HOSTNAME};

submodules:
	git submodule sync && git submodule update --init --recursive;
