.PHONY: all clean install
all: brew.txt brewCask.txt

brew.txt:
	brew leaves > brew.txt

brewCask.txt:
	brew list --cask > brewCask.txt

clean:
	rm brew.txt brewCask.txt

install:
	./bin/install.sh
