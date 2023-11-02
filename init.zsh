#!/bin/zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> /Users/exarus/.zprofile
eval "$(/usr/local/bin/brew shellenv)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
xcode-select --install
brew bundle
# chezmoi (before all)
chezmoi init --apply git@github.com:exarus/dotfiles.git
exec zsh

open -W /usr/local/Caskroom/battle-net/latest/Battle.net-Setup.app # battle-net (interactive)
gh auth login -h github.com -p ssh # gh (interactive)
mkdir ~/MEGAsync # megasync

# google-chrome (interactive)
git clone git@github.com:iamadamdev/bypass-paywalls-chrome.git ~/Projects/utils/bypass-paywalls-chrome
open ~/Projects/utils/bypass-paywalls-chrome
# see https://github.com/iamadamdev/bypass-paywalls-chrome#installation-instructions

# keka (interactive)
open -W /Applications/KekaExternalHelper.app
brew uninstall --cask kekaexternalhelper

# logi-options-plus (interactive)
sudo open -W "$(brew info --cask logi-options-plus | sed -n 3p | cut -d ' ' -f1)/logioptionsplus_installer.app"

# fnm
fnm install --lts
npm up -g
corepack enable
corepack prepare yarn@stable --activate

# iterm2
git clone --depth 1 https://github.com/mbadolato/iTerm2-Color-Schemes.git
./iTerm2-Color-Schemes/tools/import-scheme.sh ./iTerm2-Color-Schemes/schemes/*
rm -rf ./iTerm2-Color-Schemes

# micro
micro -plugin install editorconfig
micro -plugin install wakatime

# prevent Bluetooth from waking Mac
brew install sleepwatcher blueutil
echo "$(which blueutil) -p 0" > ~/.sleep
echo "$(which blueutil) -p 1" > ~/.wakeup
chmod 755 ~/.sleep ~/.wakeup
brew services restart sleepwatcher
