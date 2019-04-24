### provisoning a new linux virtual machine environment ###

#!/bin/bash

cd ~

sudo apt update
sudo apt upgrade -y
sudo apt install -y build-essential curl file git

##brew is a packager that knows how to speak to other packagers
if [ -z $(which brew) ]; then
echo "installing brew"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
## add brew to your path
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
fi

## upgrades brew if you have already installed it
if [ -n $(which brew) ]; then
echo "brew already installed"
echo "updating brew"
brew upgrade
echo "update complete"
fi

## installs gcc if not already installed
if [ -z $(which gcc) ]; then
echo "installing gcc"
brew install gcc
else echo "gcc exists"
fi

## installs git if not already installed
if [ -z $(which git) ]; then
echo "installing git"
brew install git
else echo "git exists"
fi

## installs az if not already installed
if [ -z $(which az) ]; then
echo "installing azure"
brew install azure-cli
else echo "azure exists"
fi

## installs node if not already installed
if [ -z $(which node) ]; then
echo "installing node"
brew install node
else echo "node exists"
fi

exit 0
