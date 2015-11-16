#!/usr/bin/env bash

set -e

# Install command line tools for Xcode
if [[ ! -x /usr/bin/gcc ]]; then
	xcode-select –-install
fi

# Install homebrew
if [[ ! -x /usr/local/bin/brew ]]; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update brew
brew update

# Install git
if [[ ! -x /usr/bin/git ]]; then
	brew install git
fi

# Install ansible
if [[ ! -x /usr/local/bin/ansible ]]; then
	brew install ansible
fi

# Install brew cask
if [[ ! -x /usr/local/bin/brew-cask ]]; then
	brew install caskroom/cask/brew-cask
fi

export PATH=/usr/local/bin:$PATH

ansible-playbook playbook.yml --ask-become-pass

brew cleanup
brew cask cleanup
