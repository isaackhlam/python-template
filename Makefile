install:
	git config core.hooksPath .githooks
	git submodule update --init --recursive --remote --force
	pip install -r requirement.txt

lint/quick:
	git ls-files -m '*.py' | flake8

format/quick:
	git ls-files -m '*.py' | xargs -I {} black {}
	git ls-files -m '*.py' | xargs -I {} isort {}

lint:
	for i in $$(ls -d py-*/); do flake8 $$i; bandit -r $$i; done

format:
	for i in $$(ls -d py-*/); do python -m black $$i; isort $$i; done
