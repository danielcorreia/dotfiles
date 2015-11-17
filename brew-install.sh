#!/bin/sh

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew
if test ! $(which brew)
then
	echo "  Installing Homebrew for you."

	# Install the correct homebrew for each OS type
	if test "$(uname)" = "Darwin"
	then
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		echo "Can't install Homebrew here!"
	fi
else
	# Make sure we’re using the latest Homebrew.
	brew update

	# Upgrade any already-installed formulae.
	brew upgrade --all
fi

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Install usefull binaries
brew install git
brew install git-flow
brew install python
brew install python3
brew install node
brew install tree
brew install tmux
brew install mysql
brew install httpie

# Install brew cask
brew install caskroom/cask/brew-cask

# Give use to brew cask and install apps
brew cask install google-chrome
brew cask install firefox
brew cask install dropbox
brew cask install iterm2
brew cask install sublime-text
brew cask install the-unarchiver
brew cask install sequel-pro
brew cask install vlc
brew cask install transmission
brew cask install evernote
brew cask install slack
brew cask install spotify
brew cask install spotifree
brew cask install dash
brew cask install alfred
brew cask install steam
brew cask install mou

brew cleanup

exit 0
