#!/usr/bin/env bash

# Install Homebrew
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install software via brew
brew install $(xargs <lists/brew)

# Install casks
brew cask install $(xargs <lists/brew-cask)

# Install software from Mac App Store
mas install $(awk '{print $1}' <lists/mas | xargs)

for file in $(ls -1 rc); do
  cp -v rc/${file} ~/.${file}rc
done

for file in $(ls -1 dotdirs); do
  cp -rv dotdirs/${file} ~/.${file}
done
