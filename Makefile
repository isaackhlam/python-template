install:
	git config core.hooksPath .githooks
	git submodule update --init --recursive --remote --force
