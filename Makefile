SHELL        := /bin/zsh
UNAME        := $(shell uname -s)
USER         := $(shell whoami)

ifeq      ($(UNAME), Darwin)
	OS  := macos
	DEP := dependencies
	SET := setup
endif

.PHONY: all install

all: install

install: $(OS)
setup: $(SET)

.PHONY: help usage
.SILENT: help usage

help: usage

usage:
	printf "\\n\
	\\033[1mDOTFILES\\033[0m\\n\
	\\n\
	Custom settings and configurations for Unix-like environments.\\n\
	See README.md for detailed usage information.\\n\
	\\n\
	\\033[1mUSAGE:\\033[0m make [target]\\n\
	\\n\
	  make install		Install all dependencies and applications.\\n\
	\\n\
	  make set			Install and  setup os, shell, and editor configurations. Make sure to setup zsh and restart the terminal before running set command.\\n\
	\\n\
	"

.PHONY: list

list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

stow:
	stow git
	stow tmux
	stow vim
	stow zsh

development:
	sh ~/dotfile/dev/npm.sh
	sh ~/dotfile/dev/pip.sh

node:
	wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

ycm:
	git clone https://github.com/ycm-core/ycmd.git ~/ycmd
	cd ~/ycmd && git submodule update --init --recursive
	python3 ~/ycmd/build.py --ts-completer

zgen:
	git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

.PHONY: dependencies setup

dependencies:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	sh ~/dotfile/macos/brew.sh

setup: dev ycm
	xcode-select --install
	brew install duti
	sh ~/dotfile/macos/duti/set.sh

macos: stow dependencies node zgen
