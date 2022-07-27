# Makefile
SHELL = /bin/bash

# Environment
.ONESHELL:
venv:
	python3 -m venv venv
	source venv/bin/activate && \
	python3 -m pip install pip setuptools wheel && \
	python3 -m pip install -e .

dev:
	python3 -m pip install -e ".[dev]"
# Styling
.PHONY: style
style:
	black .
	-pylint --recursive=y app
	python3 -m isort .

# Cleaning
.PHONY: clean
clean: style
	find . -type f -name "*.DS_Store" -ls -delete
	find . | grep -E "(__pycache__|\.pyc|\.pyo)" | xargs rm -rf
	find . | grep -E ".pytest_cache" | xargs rm -rf
	find . | grep -E ".ipynb_checkpoints" | xargs rm -rf
	rm -f .coverage

# Test
.PHONY: test
test:
	python3 -m pytest --cov app --cov-report html


.PHONY: help
help:
	@echo "Commands:"
	@echo "venv    : creates a virtual environment."
	@echo "style   : executes style formatting."
	@echo "clean   : cleans all unnecessary files."